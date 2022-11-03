import 'package:flutter/material.dart';
import 'package:france_termes/models/article.dart';
import 'package:france_termes/providers/data_provider.dart';
import '../../models/statut.dart';
import '../../models/term.dart';
import '../page/article_page.dart';
import 'article_abstract_preview.dart';
import 'article_field/article_preview_card.dart';

class ArticleResultPreview extends ArticleAbstractPreview {
  const ArticleResultPreview(
      {Key? key,
      required this.query,
      required this.article,
      required this.provider,
      required this.field})
      : super(key: key);

  final String query;
  final Article article;
  final DataProvider provider;
  final String? field;

  List<String> _termWordsStartWith(Term term, String query) =>
      term.wordsStartWith(query);

  List<String> _termVariantsStartWith(Term term, String query) =>
      term.variantsStartWith(query);

  _matchVariant(List<String> variants, Term term,
      List<String> Function(Term, String) searchFunction) {
    switch (term.statut) {
      case Statut.iPrivilegie:
      case Statut.iSynonyme:
      case Statut.iAntonyme:
      case Statut.iCapitale:
      case Statut.iToponyme:
        variants.addAll(searchFunction(term, query));
        break;
      default:
    }
  }

  @override
  List<String>? matchVariants(Term principal) {
    final variants = <String>[];
    for (final term in article.terms) {
      if (principal == term) {
        _matchVariant(variants, term, _termVariantsStartWith);
      } else {
        _matchVariant(variants, term, _termWordsStartWith);
      }
    }
    return variants.isEmpty ? null : variants;
  }

  _matchEquivalent(List<String> variants, Term term,
      List<String> Function(Term, String) searchFunction) {
    switch (term.statut) {
      case Statut.iEquivalent:
      case Statut.iAdmis:
        variants.addAll(searchFunction(term, query));
        break;
      default:
    }
  }

  @override
  List<String>? matchEquivalents(Term principal) {
    final variants = <String>[];
    for (final term in article.terms) {
      if (term == principal) {
        _matchEquivalent(variants, term, _termVariantsStartWith);
      } else {
        _matchEquivalent(variants, term, _termWordsStartWith);
      }
    }
    return variants.isEmpty ? null : variants;
  }

  @override
  Widget build(BuildContext context) {
    String? fieldUsed = field ??
        (article.fields.isNotEmpty ? article.fields.first.field : null);

    return ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(article, provider))),
        title: ArticlePreviewCard(
            children: super.buildChildren(article, fieldUsed)));
  }
}
