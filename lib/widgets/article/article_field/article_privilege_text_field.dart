import 'package:flutter/material.dart';
import 'package:france_termes/models/term.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

class ArticlePrivilegeTermTextField extends StatelessWidget {
  final Term term;
  const ArticlePrivilegeTermTextField(this.term, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle style = ThemeConstants.coloredTextStyleDefault(context);
    List<TextSpan> children = [];
    if (term.partOfSpeech.isNotEmpty) {
      children.add(TextSpan(text: ", ${term.partOfSpeech}"));
    }
    return SelectableText.rich(
      TextSpan(children: [
        TextSpan(text: term.word, style: style, children: children),
      ]),
    );
  }
}
