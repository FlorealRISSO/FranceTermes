import 'package:flutter/material.dart';

import '../../themes/theme_constants.dart';

class ArticleSimpleTextField extends StatelessWidget {
  final String text;
  const ArticleSimpleTextField(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = ThemeConstants.coloredTextStyleDefault(context);

    return SelectableText.rich(
      TextSpan(text: text, style: style),
    );
  }
}
