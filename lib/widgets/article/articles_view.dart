import 'package:flutter/material.dart';
import 'package:france_termes/models/article.dart';
import 'package:france_termes/models/statut.dart';
import 'package:france_termes/models/term.dart';
import 'package:france_termes/widgets/article/article_field/article_simple_text_field.dart';
import 'package:france_termes/widgets/article/article_field/article_standard_term_text_field.dart';
import 'package:collection/collection.dart';
import './article_field/article_domain_text_field.dart';
import '../themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'article_field/article_privilege_text_field.dart';

class Tuple4Terms {
  Term? privilegie;
  Term? capital;
  Term? toponyme;
  Term? siege;
}

class ArticleView extends StatelessWidget {
  final Article article;
  const ArticleView(this.article, {Key? key}) : super(key: key);

  Widget _buildTextCard(BuildContext context, Widget text) {
    return ListTile(
      title: Card(
        semanticContainer: true,
        color: ThemeConstants.articleInternalCardColor(context),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
        ),
        child: Padding(padding: const EdgeInsets.all(4), child: text),
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }

  void _addField(BuildContext context, String fieldName, Widget text,
      List<Widget> children) {
    children.add(Text(fieldName));
    children.add(_buildTextCard(context, text));
  }

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

  void addPriviligieField(
      BuildContext context, Term? term, List<Widget> children) {
    if (term != null) {
      String fieldName = Statut.fromIntToLang(context, term.statut);
      _addField(
          context, fieldName, ArticlePrivilegeTermTextField(term), children);

      for (final pair in IterableZip([term.variantTypes, term.variantWords])) {
        _addField(
            context,
            pair[0],
            ArticleSimpleTextField(
              pair[1],
            ),
            children);
      }
    }
  }

  void addListField(BuildContext context, String fieldName, List<Term> terms,
      List<Widget> children) {
    if (terms.isNotEmpty) {
      _addField(
          context, fieldName, ArticleStandardTermTextField(terms), children);
    }
  }

  void sortTerms(final List<List<Term>> listOfList) {
    for (final list in listOfList) {
      list.sort((term1, term2) => term1.word.compareTo(term2.word));
    }
  }

  @override
  Widget build(BuildContext context) {
    Tuple4Terms terms = Tuple4Terms();
    final List<Term> synonyms = [];
    final List<Term> antonyms = [];
    final List<Term> equivalents = [];
    buildFields(terms, synonyms, antonyms, equivalents);
    sortTerms([synonyms, antonyms, equivalents]);

    List<Widget> children = [];
    addPriviligieField(context, terms.privilegie, children);
    addPriviligieField(context, terms.toponyme, children);
    addPriviligieField(context, terms.capital, children);
    addPriviligieField(context, terms.siege, children);
    addListField(context, Statut.fromIntToLang(context, Statut.iSynonyme),
        synonyms, children);
    addListField(context, Statut.fromIntToLang(context, Statut.iAntonyme),
        antonyms, children);
    if (article.domains.isNotEmpty) {
      _addField(context, AppLocalizations.of(context)!.field,
          ArticleDomainTextField(article.domains), children);
    }
    if (article.definition.isNotEmpty) {
      _addField(context, AppLocalizations.of(context)!.definition,
          ArticleSimpleTextField(article.definition), children);
    }
    addListField(context, AppLocalizations.of(context)!.equivalents,
        equivalents, children);
    if (article.notes.isNotEmpty) {
      _addField(context, AppLocalizations.of(context)!.notes,
          ArticleSimpleTextField(article.notes), children);
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
                children: children,
              ),
            )));
  }
}
