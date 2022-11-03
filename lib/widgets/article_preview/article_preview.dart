import 'package:flutter/material.dart';
import 'package:france_termes/models/article.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/widgets/page/article_page.dart';
import '../../models/term.dart';
import 'article_abstract_preview.dart';
import 'article_field/article_preview_card.dart';

class ArticlePreview extends ArticleAbstractPreview {
  final DataProvider provider;
  final Article article;
  const ArticlePreview(this.article, this.provider, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? field =
        article.fields.isNotEmpty ? article.fields.first.field : null;
    return ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(article, provider))),
        title: ArticlePreviewCard(children: buildChildren(article, field)));
  }

  @override
  List<String>? matchEquivalents(Term principal) {
    return null;
  }

  @override
  List<String>? matchVariants(Term principal) {
    return null;
  }
}
