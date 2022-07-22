import 'package:flutter/material.dart';
import 'package:france_termes/models/term.dart';

import '../../themes/theme_constants.dart';

class ArticleStandardTermTextField extends StatelessWidget {
  final List<Term> terms;
  const ArticleStandardTermTextField(this.terms, {Key? key}) : super(key: key);
  TextSpan _buildEquivalentsContent(Term term, TextStyle style) {
    if (term.variantWords.isEmpty) {
      return TextSpan(
        text: "${term.word} (${term.langage}) ",
        style: style,
      );
    }
    return TextSpan(children: [
      TextSpan(
        text: term.word,
        style: style,
      ),
      TextSpan(
          text: ", ${term.variantWords.join(', ')} (${term.langage}) ",
          style: style),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = ThemeConstants.coloredTextStyleDefault(context);

    List<InlineSpan> termsContent = [];
    for (final Term term in terms) {
      termsContent.add(_buildEquivalentsContent(term, style));
    }
    return SelectableText.rich((TextSpan(children: [
      TextSpan(
        style: style,
        children: termsContent,
      ),
    ])));
  }
}
