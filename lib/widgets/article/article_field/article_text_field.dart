import 'package:flutter/material.dart';

import '../../themes/theme_constants.dart';

class ArticleTextField extends StatelessWidget {
  final String text;
  const ArticleTextField(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = ThemeConstants.coloredTextStyleDefault(context);

    return SelectableText.rich(
      TextSpan(text: text, style: style),
    );
  }
}
