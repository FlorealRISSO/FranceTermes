import 'package:flutter/material.dart';

import '../../models/article.dart';
import '../../models/statut.dart';
import '../../models/term.dart';
import 'article_field/article_domain_text_field.dart';
import 'article_field/article_equivalent_text_field.dart';
import 'article_field/article_privileged_text_field.dart';

abstract class ArticleAbstractPreview extends StatelessWidget {
  const ArticleAbstractPreview({Key? key}) : super(key: key);

  List<Widget> buildChildren(Article article, String? field) {
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
      children.add(ArticlePrivilegedTextField(
          principal: privileged.word, secondaries: matchVariants(privileged)));
    }
    if (field != null) {
      children.add(ArticleDomainTextField(field));
    }
    if (equivalent != null) {
      children.add(ArticleEquivalentTextField(
        principal: equivalent.word,
        secondaries: matchEquivalents(equivalent),
      ));
    }
    return children;
  }

  List<String>? matchVariants(Term principal);
  List<String>? matchEquivalents(Term principal);
}
