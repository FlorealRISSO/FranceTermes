import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

import '../../../models/term.dart';

class ArticlePrivilegedTextField extends StatelessWidget {
  final Term term;
  const ArticlePrivilegedTextField(this.term, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle principalStyle = TextStyle(
      fontSize: ThemeConstants.textSizeDefault,
      fontWeight: FontWeight.bold,
      color: ThemeConstants.actionsColor(context),
    );
    return RichText(
      text: TextSpan(
        text: term.word,
        style: principalStyle,
      ),
    );
  }
}
