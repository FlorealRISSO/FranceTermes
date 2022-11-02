import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';
import 'article_term_field.dart';

class ArticlePrivilegedTextField extends ArticleTermField {
  final String principal;
  final List<String>? secondaries;

  const ArticlePrivilegedTextField(
      {Key? key, required this.principal, this.secondaries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle principalStyle = TextStyle(
      fontSize: ThemeConstants.textSizeDefault,
      fontWeight: FontWeight.bold,
      color: ThemeConstants.actionsColor(context),
    );
    return RichText(
      text: TextSpan(
        text: principal,
        style: principalStyle,
        children: buildSecondaries(context, secondaries),
      ),
    );
  }
}
