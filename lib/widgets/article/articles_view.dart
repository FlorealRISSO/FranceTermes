import 'package:flutter/material.dart';
import 'package:france_termes/models/article.dart';
import 'package:france_termes/models/statut.dart';
import 'package:france_termes/models/term.dart';
import 'package:france_termes/widgets/article/article_field/article_text_card.dart';
import 'package:collection/collection.dart';
import '../themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'article_field/article_field_name_text.dart';

class Tuple4Terms {
  Term? privilegie;
  Term? capital;
  Term? toponyme;
  Term? siege;
}

class ArticleView extends StatelessWidget {
  final Article article;
  const ArticleView(this.article, {Key? key}) : super(key: key);

  /// To understand read `statut.dart`
  void buildFields(Tuple4Terms terms, List<Term> synonyms, List<Term> antonyms,
      List<Term> equivalents) {
    for (Term term in article.terms) {
      switch (term.statut) {
        case Statut.iToponyme:
          terms.toponyme = term;
          break;
        case Statut.iCapitale:
          terms.capital = term;
          break;
        case Statut.iPrivilegie:
          terms.privilegie = term;
          break;
        case Statut.iSiege:
          terms.siege = term;
          break;
        case Statut.iSynonyme:
          synonyms.add(term);
          break;
        case Statut.iAntonyme:
          antonyms.add(term);
          break;
        case Statut.iEquivalent:
          equivalents.add(term);
          break;
        default:
      }
    }
  }

  void addField(String fieldName, String fieldContent, List<Widget> fieldList) {
    fieldList.add(ArticleFieldNameText(fieldName));
    fieldList.add(ArticleTextCard(fieldContent));
  }

  String buildPriviligieString(Term term) {
    return term.word;
  }

  String buildFrenchVariantString(List<Term> terms) {
    StringBuffer buffer = StringBuffer();
    int i = 0;
    for (final term in terms) {
      buffer.write(term.word);
      buffer.write(term.variantWords.join(', '));
      if (i != terms.length - 1) {
        buffer.write(" - ");
      }
    }
    return buffer.toString();
  }

  String buildEquivalentString(List<Term> terms) {
    StringBuffer buffer = StringBuffer();
    int i = 0;
    for (final term in terms) {
      buffer.write(term.word);
      if (term.variantWords.isNotEmpty) {
        buffer.write(" [");
        buffer.write(term.variantWords.join(', '));
        buffer.write("]");
      }
      buffer.write(" (${term.langage})");
      if (i != terms.length - 1) {
        buffer.write(" - ");
      }
      i += 1;
    }
    return buffer.toString();
  }

  String buildDomainString(List<String> domains) {
    return domains.join(" - ").toUpperCase();
  }

  void addPriviligiesField(
      BuildContext context, Term? term, List<Widget> fieldList) {
    if (term != null) {
      String fieldName = Statut.fromIntToLang(context, term.statut);
      String fieldContent = buildPriviligieString(term);
      addField(fieldName, fieldContent, fieldList);
      for (final tuple in IterableZip([term.variantTypes, term.variantWords])) {
        addField(tuple[0], tuple[1], fieldList);
      }
    }
  }

  // void addListField(BuildContext context, String fieldName, List<Term> terms,
  //     List<Widget> children) {
  //   if (terms.isNotEmpty) {
  //     _addField(
  //         context, fieldName, ArticleFrenchTermTextField(terms), children);
  //   }
  // }

  // void addEquivalentListField(BuildContext context, String fieldName,
  //     List<Term> terms, List<Widget> children) {
  //   if (terms.isNotEmpty) {
  //     _addField(
  //         context, fieldName, ArticleEquivalentTermTextField(terms), children);
  //   }
  // }

  void sortTerms(final List<List<Term>> listOfList) {
    for (final list in listOfList) {
      list.sort((term1, term2) => term1.word.compareTo(term2.word));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Tuple4Terms terms = Tuple4Terms();
    final List<Term> synonyms = [];
    final List<Term> antonyms = [];
    final List<Term> equivalents = [];
    buildFields(terms, synonyms, antonyms, equivalents);
    sortTerms([synonyms, antonyms, equivalents]);

    List<Widget> listField = [];

    addPriviligiesField(context, terms.privilegie, listField);
    addPriviligiesField(context, terms.toponyme, listField);
    addPriviligiesField(context, terms.capital, listField);
    addPriviligiesField(context, terms.siege, listField);

    if (synonyms.isNotEmpty) {
      addField(l10n.synonyms, buildFrenchVariantString(synonyms), listField);
    }
    if (antonyms.isNotEmpty) {
      addField(l10n.antonyms, buildFrenchVariantString(antonyms), listField);
    }
    if (article.domains.isNotEmpty) {
      addField(l10n.field, buildDomainString(article.domains), listField);
    }
    if (equivalents.isNotEmpty) {
      addField(l10n.equivalents, buildEquivalentString(equivalents), listField);
    }
    if (article.definition.isNotEmpty) {
      addField(l10n.definition, article.definition, listField);
    }

    if (article.notes.isNotEmpty) {
      addField(l10n.notes, article.notes, listField);
    }

    return ListTile(
        title: Card(
            color: ThemeConstants.itemDefaultColor(context),
            shape: RoundedRectangleBorder(
              borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listField,
              ),
            )));
  }
}
