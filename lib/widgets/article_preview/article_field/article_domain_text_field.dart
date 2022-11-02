import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

class ArticleDomainTextField extends StatelessWidget {
  final String domain;
  const ArticleDomainTextField(this.domain, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: domain.toUpperCase(),
          style: TextStyle(
              fontSize: ThemeConstants.textSizeDefault,
              fontWeight: FontWeight.normal,
              color: ThemeConstants.actionsColor(context))),
    );
  }
}
