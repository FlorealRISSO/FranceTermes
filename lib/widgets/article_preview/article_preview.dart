import 'package:flutter/material.dart';
import 'package:france_terme/models/article.dart';
import 'package:france_terme/models/statut.dart';
import 'package:france_terme/providers/data_provider.dart';
import 'package:france_terme/widgets/page/article_page.dart';
import '../../models/term.dart';
import '../themes/theme_constants.dart';
import 'article_field/article_domain_text_field.dart';
import 'article_field/article_equivalent_text_field.dart';
import 'article_field/article_privileged_text_field.dart';

class ArticlePreview extends StatelessWidget {
  final DataProvider provider;
  final Article article;
  const ArticlePreview(this.article, this.provider, {Key? key})
      : super(key: key);

  List<Widget> _buildChildren() {
    Term? equivalent;
    Term? privileged;
    for (Term term in article.terms) {
      switch (term.statut) {
        case Statut.iToponyme:
        case Statut.iPrivilegie:
          privileged ??= term;
          break;
        case Statut.iEquivalent:
          equivalent ??= term;
          break;
      }
    }

    final List<Widget> children = [];
    if (privileged != null) {
      children.add(ArticlePrivilegedTextField(privileged));
    }
    if (article.domains.isNotEmpty) {
      children.add(ArticleDomainTextField(article.domains));
    }
    if (equivalent != null) {
      children.add(ArticleEquivalentTextField(equivalent));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(article, provider))),
        title: Card(
          color: ThemeConstants.itemDefaultColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildChildren(),
              )),
        ));
  }
}
