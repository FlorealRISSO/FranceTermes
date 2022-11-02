import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

import 'article_term_field.dart';

class ArticleEquivalentTextField extends ArticleTermField {
  final String principal;
  final List<String>? secondaries;

  const ArticleEquivalentTextField(
      {Key? key, required this.principal, this.secondaries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: principal,
        children: buildSecondaries(context, secondaries),
        style: TextStyle(
            color: ThemeConstants.actionsColor(context),
            fontSize: ThemeConstants.textSizeDefault),
      ),
    );
  }
}
