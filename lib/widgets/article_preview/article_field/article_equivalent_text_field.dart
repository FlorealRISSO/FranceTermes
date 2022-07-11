import 'package:flutter/material.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';
import '../../../models/term.dart';

class ArticleEquivalentTextField extends StatelessWidget {
  final Term equivalent;
  const ArticleEquivalentTextField(this.equivalent, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: equivalent.word,
        style: TextStyle(
            color: ThemeConstants.actionsColor(context), fontSize: 20),
      ),
    );
  }
}
