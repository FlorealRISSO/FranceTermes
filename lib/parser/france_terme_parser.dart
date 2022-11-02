import 'dart:collection';

import 'package:france_termes/models/domain.dart';
import 'package:france_termes/models/sub_domain.dart';

import '/models/metadata.dart';
import '/models/statut.dart';
import '/models/term.dart';
import '/models/article.dart';

import 'package:tuple/tuple.dart';
import 'package:xml/xml.dart';
import 'package:intl/intl.dart';

typedef TupleVariants = Tuple2<List<String>, List<String>>;

/// The fields name of the XML files
/// Need to change if the XML files change
class XmlConstants {
  static const String equivalentField = 'Equivalent';
  static const String equivalentProp = 'Equi_prop';
  static const String varianteDefaultType = 'Abréviation';
  static const String langage = 'langue';
  static const String admis = 'admis';
  static const String domainList = 'Domaine';
  static const String domainField = '<Dom';
  static const String termField = 'Terme';
  static const String termVariantes = 'variantes';
  static const String termVariante = 'variante';
  static const String termVarianteType = 'type';
  static const String statut = 'statut';
  static const String articleId = 'id';
  static const String definition = 'Definition';
  static const String articleNum = 'numero';
  static const String articleDate = 'DatePub';
  static const String articleField = 'Article';
  static const String termPartOfSpeech = 'categorie';
  static const String toSee = "Voir";
  static const String toSeeIndividual = "A";
  static const String toSeeAttribute = "href";
  static const String antonyme = "Antonyme";
  static const String notes = "Notes";
  static const String warning = "Attention";
  static const String toQuestion = "A-interroger";
  static const String defaultLang = "fr";
  static const String subDomainField = "<S-dom";
  static const String url = "url";
}

class TermeParser {
  final XmlDocument xml;
  final Map<String, Domain> domainsMap = HashMap();
  final Map<int, SubDomain> subDomainMap = HashMap();
  TermeParser(this.xml);

  String parseNotes(XmlElement xmlArticle) {
    return xmlArticle
            .getElement(XmlConstants.notes)
            ?.text
            .replaceFirst("\n", "") ??
        "";
  }

  String parseWarning(XmlElement xmlArticle) {
    return xmlArticle.getElement(XmlConstants.warning)?.text ?? "";
  }

  String parseToQuestion(XmlElement xmlArticle) {
    return xmlArticle.getElement(XmlConstants.toQuestion)?.text ?? "";
  }

  parseUrl(String? url, List<int> toSee) {
    if (url == null) return;
    final RegExp regex = RegExp(r"(([0-9])[0-9]*)");
    String? strId = regex.firstMatch(url)?[0];
    if (strId == null) return;
    int? id = int.tryParse(strId);
    if (id == null) return;
    toSee.add(id);
  }

  /// There are two kinds of "to see" elements,
  /// the first is in the field <Voir></Voir>
  /// the second is in <Terme> when the attribute statut="antonyme" there is the attribute url...
  void parseToSee(XmlElement xmlArticle, List<int> toSee) {
    final List<int> toSee = [];
    for (final XmlElement elements
        in xmlArticle.findAllElements(XmlConstants.toSee)) {
      for (final XmlElement element
          in elements.findAllElements(XmlConstants.toSeeIndividual)) {
        String? url = element.getAttribute(XmlConstants.toSeeAttribute);
        parseUrl(url, toSee);
      }
    }
  }

  Metadata parseMetadata(XmlElement xmlArticle, List<int> toSee) {
    final String notes = parseNotes(xmlArticle);
    parseToSee(xmlArticle, toSee);
    final String toQuestion = parseToQuestion(xmlArticle);
    final warning = parseWarning(xmlArticle);
    return Metadata(notes, "", warning, toQuestion, toSee);
  }

  TupleVariants parseEquivalentVariants(XmlElement xmlEquivalent) {
    final List<String> variantsTypes = [];
    final List<String> variantsWords = [];
    for (final variante
        in xmlEquivalent.findAllElements(XmlConstants.termVariante)) {
      final value = variante.text.replaceAll('\n', "");
      variantsTypes.add(XmlConstants.varianteDefaultType);
      variantsWords.add(value);
    }
    return TupleVariants(variantsTypes, variantsWords);
  }

  TupleVariants parseTermVariants(XmlElement xmlTerm) {
    final List<String> variantsTypes = [];
    final List<String> variantsWords = [];
    for (final XmlElement xmlVariants
        in xmlTerm.findElements(XmlConstants.termVariantes)) {
      final String type =
          xmlVariants.getAttribute(XmlConstants.termVarianteType) ??
              XmlConstants.varianteDefaultType;
      final String variant = xmlVariants
          .findElements(XmlConstants.termVariante)
          .first
          .text
          .replaceAll('\n', "");
      variantsTypes.add(type); // [type1,variant1,type2,variant2...]
      variantsWords.add(Term.deletePartOfSpeech(variant));
    }
    return TupleVariants(variantsTypes, variantsWords);
  }

  /// Sometime the XML file does not have the "Terme" in attribute
  /// To solve this issue we need to get the word from an other source
  /// Sometimes it's avable in the Terme.text but we need to parse it correcly
  /// beacuse there are more information than needed.
  String parseTermWord(XmlElement xmlTerm) {
    return xmlTerm.getAttribute(XmlConstants.termField) ??
        xmlTerm.text.replaceAll("\n", "");
  }

  static int hashTerm(int statut, String word, String partOfSpeech,
      String langage, List<String> variants) {
    return statut.hashCode ^
        word.hashCode ^
        variants.hashCode ^
        partOfSpeech.hashCode;
  }

  void parseEquivalentWord(XmlElement xmlEquivalent, String langage,
      List<Term> equivalents, TupleVariants variants) {
    String? admitted = xmlEquivalent.getAttribute(XmlConstants.admis);
    final int statut = admitted != null && admitted == XmlConstants.admis
        ? Statut.fromStr(admitted)
        : Statut.fromStr(Statut.equivalent);
    for (final equivalentProp
        in xmlEquivalent.findAllElements(XmlConstants.equivalentProp)) {
      final word = equivalentProp.text.replaceAll('\n', ''); // Cleaning
      final String partOfSpeech = Term.parsePartOfSpeech(word);
      final String clearWord =
          partOfSpeech.isEmpty ? word : Term.deletePartOfSpeech(word);
      final term = Term(
        statut,
        clearWord,
        variants.item1,
        variants.item2,
        partOfSpeech,
        langage: langage,
      );
      equivalents.add(term);
    }
  }

  void parseEquivalent(XmlElement xmlArticle, List<Term> equivalents) {
    for (final xmlEquivalent
        in xmlArticle.findAllElements(XmlConstants.equivalentField)) {
      final equivalentVariants = parseEquivalentVariants(xmlEquivalent);
      final String langage = xmlEquivalent.getAttribute(XmlConstants.langage)!;
      parseEquivalentWord(
          xmlEquivalent, langage, equivalents, equivalentVariants);
    }
  }

  void parseAntonymTooSee(XmlElement xmlAntonymn, List<int> toSee) {
    String? url = xmlAntonymn.getAttribute(XmlConstants.url);
    parseUrl(url, toSee);
  }

  Term parseTerm(XmlElement xmlTerm, List<int> toSee) {
    final String word = parseTermWord(xmlTerm);
    final int statut =
        Statut.fromStr(xmlTerm.getAttribute(XmlConstants.statut)!);
    if (statut == Statut.iAntonyme) parseAntonymTooSee(xmlTerm, toSee);
    final String partOfSpeech =
        xmlTerm.getAttribute(XmlConstants.termPartOfSpeech) ?? "";
    final TupleVariants variants = parseTermVariants(xmlTerm);
    return Term(statut, word, variants.item1, variants.item2, partOfSpeech);
  }

  parseTerms(XmlElement xmlArticle, List<Term> terms, List<int> toSee) {
    for (final xmlTerm in xmlArticle.findAllElements(XmlConstants.termField)) {
      final Term term = parseTerm(xmlTerm, toSee);
      terms.add(term);
    }
  }

  void parseDomaines(XmlElement xmlArticle, List<Domain> domains,
      List<SubDomain> subDomainList) {
    for (final xmlDomaine
        in xmlArticle.findAllElements(XmlConstants.domainList)) {
      for (final child in xmlDomaine.children) {
        final element = child.outerXml;
        if (element.startsWith(XmlConstants.domainField)) {
          // If it's a Domain
          String domainStr = child.text;
          domainsMap.putIfAbsent(domainStr, () => Domain(domainStr));
          domains.add(domainsMap[domainStr]!); //* Warning ^^^^^^
        } else if (element.startsWith(XmlConstants.subDomainField)) {
          // If it's a SubDomain
          String subDomainStr = child.text;
          Domain currentDomain = domains.last;
          int uniqueKey = subDomainStr.hashCode + currentDomain.hashCode;
          if (subDomainMap.containsKey(uniqueKey)) {
            SubDomain subDomain = subDomainMap[uniqueKey]!;
            subDomainList.add(subDomain);
          } else {
            SubDomain subDomain = SubDomain(subDomainStr);
            subDomainMap[uniqueKey] = subDomain;
            currentDomain.subFields.add(subDomain);
            subDomainList.add(subDomain);
          }
        }
      }
    }
  }

  List<Term> parseAllTerms(XmlElement xmlArticle, List<int> toSee) {
    List<Term> terms = [];
    parseEquivalent(xmlArticle, terms);
    parseTerms(xmlArticle, terms, toSee);
    return terms;
  }

  String parseDefinition(XmlElement xmlArticle) {
    final String definition = xmlArticle
        .getElement(XmlConstants.definition)!
        .text
        .replaceAll("\n", "");
    return definition;
  }

  Article parseArticle(XmlElement xmlArticle) {
    final int articleId = int.parse(xmlArticle.getAttribute('id')!);
    final String articleNumero =
        xmlArticle.getAttribute(XmlConstants.articleNum)!;
    final String articleStringDate =
        xmlArticle.findElements(XmlConstants.articleDate).first.text;
    final DateTime articleDate = DateFormat('d/M/y').parse(articleStringDate);
    final List<Domain> domains = [];
    final List<SubDomain> subDomains = [];
    parseDomaines(xmlArticle, domains, subDomains);
    final List<int> toSee = [];
    final Metadata articleMetadata = parseMetadata(xmlArticle, toSee);
    final List<Term> terms = parseAllTerms(xmlArticle, toSee);
    final String definition = parseDefinition(xmlArticle);
    final article = Article(
        articleId,
        articleNumero,
        articleDate,
        definition,
        articleMetadata.toSeeId,
        articleMetadata.notes,
        articleMetadata.source,
        articleMetadata.warning,
        articleMetadata.toQuestion);
    article.terms.addAll(terms);
    article.fields.addAll(domains);
    article.subFields.addAll(subDomains);
    return article;
  }

  List<Article> fullParse() {
    final List<Article> articles = [];
    for (final XmlElement xmlArticle
        in xml.findAllElements(XmlConstants.articleField)) {
      try {
        final Article article = parseArticle(xmlArticle);
        articles.add(article);
      } catch (e) {
        continue;
      }
    }
    return articles;
  }
}
