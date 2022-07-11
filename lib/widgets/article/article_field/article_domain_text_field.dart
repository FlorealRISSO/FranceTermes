import 'package:flutter/material.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';

class ArticleDomainTextField extends StatelessWidget {
  final List<String> domains;

  const ArticleDomainTextField(this.domains, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle style = ThemeConstants.coloredTextStyleDefault(context);
    return SelectableText.rich(
      TextSpan(children: [
        TextSpan(text: domains.join(", ").toUpperCase(), style: style),
      ]),
    );
  }
}
