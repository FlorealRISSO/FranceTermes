import 'dart:collection';

import 'package:france_termes/models/domain.dart';

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
  static const String subDomainField =
      "<S-dom"; // TODO: Add a way to parse subdomains
}

class TermeParser {
  final XmlDocument xml;
  final Map<String, Domain> domainsMap = HashMap();
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

  String parseUrl(String url) {
    final RegExp regex = RegExp(r"(([0-9])[0-9]*)");
    return regex.firstMatch(url)?[0] ?? "";
  }

  /// There are two kinds of "to see" elements,
  /// the first is in the field <Voir></Voir>
  /// the second is in <Terme> when the attribute statut="antonyme" there is the attribute url...
  List<int> parseToSee(XmlElement xmlArticle) {
    final List<int> toSee = [];
    for (final XmlElement elements
        in xmlArticle.findAllElements(XmlConstants.toSee)) {
      for (final XmlElement element
          in elements.findAllElements(XmlConstants.toSeeIndividual)) {
        String? url = element.getAttribute(XmlConstants.toSeeAttribute);
        if (url != null) {
          toSee.add(int.parse(parseUrl(url)));
        }
      }
    }
    return toSee;
  }

  Metadata parseMetadata(XmlElement xmlArticle) {
    final String notes = parseNotes(xmlArticle);
    final List<int> toSee = parseToSee(xmlArticle);
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

  parseEquivalentWord(XmlElement xmlEquivalent, String langage,
      List<Term> equivalents, TupleVariants variants) {
    final int statut = Statut.fromStr(Statut.equivalent);
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

  parseEquivalent(XmlElement xmlArticle, List<Term> equivalents) {
    for (final xmlEquivalent
        in xmlArticle.findAllElements(XmlConstants.equivalentField)) {
      final equivalentVariants = parseEquivalentVariants(xmlEquivalent);
      final String langage = xmlEquivalent.getAttribute(XmlConstants.langage)!;
      parseEquivalentWord(
          xmlEquivalent, langage, equivalents, equivalentVariants);
    }
  }

  Term parseTerm(XmlElement xmlTerm) {
    final String word = parseTermWord(xmlTerm);
    final int statut =
        Statut.fromStr(xmlTerm.getAttribute(XmlConstants.statut)!);
    final String partOfSpeech =
        xmlTerm.getAttribute(XmlConstants.termPartOfSpeech) ?? "";
    final TupleVariants variants = parseTermVariants(xmlTerm);
    return Term(statut, word, variants.item1, variants.item2, partOfSpeech);
  }

  parseTerms(XmlElement xmlArticle, List<Term> terms) {
    for (final xmlTerm in xmlArticle.findAllElements(XmlConstants.termField)) {
      final Term term = parseTerm(xmlTerm);
      terms.add(term);
    }
  }

  void parseDomaines(
      XmlElement xmlArticle, List<Domain> domains, List<int> subDomainsIndex) {
    for (final xmlDomaine
        in xmlArticle.findAllElements(XmlConstants.domainList)) {
      for (final child in xmlDomaine.children) {
        final element = child.outerXml;
        if (element.startsWith(XmlConstants.domainField)) {
          String domain = child.text;
          domainsMap.putIfAbsent(domain, () => Domain(domain, []));
          domains.add(domainsMap[domain]!); //* Warning ^^^^^^
        } else if (element.startsWith(XmlConstants.subDomainField)) {
          String subDomain = child.text;
          Domain currentDomain = domains.last;
          int hashDomain = currentDomain.hashCode;
          int idx = currentDomain.putIfAbsent(subDomain);
          subDomainsIndex.add(hashDomain);
          subDomainsIndex.add(idx);
        }
      }
    }
  }

  List<Term> parseAllTerms(XmlElement xmlArticle) {
    List<Term> terms = [];
    parseEquivalent(xmlArticle, terms);
    parseTerms(xmlArticle, terms);
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
    final List<int> subDomainsIndex = [];
    parseDomaines(xmlArticle, domains, subDomainsIndex);
    final Metadata articleMetadata = parseMetadata(xmlArticle);
    final List<Term> terms = parseAllTerms(xmlArticle);
    final String definition = parseDefinition(xmlArticle);
    final article = Article(
        articleId,
        articleNumero,
        articleDate,
        definition,
        articleMetadata.toSeeId,
        subDomainsIndex,
        articleMetadata.notes,
        articleMetadata.source,
        articleMetadata.warning,
        articleMetadata.toQuestion);
    article.terms.addAll(terms);
    article.domains.addAll(domains);
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
