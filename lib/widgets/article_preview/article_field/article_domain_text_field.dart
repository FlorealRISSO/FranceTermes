import 'package:flutter/material.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';

class ArticleDomainTextField extends StatelessWidget {
  final List<String> domains;
  const ArticleDomainTextField(this.domains, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String first =
        domains.isNotEmpty ? domains.first.toString().toUpperCase() : "";
    return RichText(
      text: TextSpan(
          text: first,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: ThemeConstants.actionsColor(context))),
    );
  }
}
