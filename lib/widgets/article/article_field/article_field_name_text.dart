import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

class ArticleFieldNameText extends StatelessWidget {
  final String fieldName;
  const ArticleFieldNameText(this.fieldName, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: ThemeConstants.textSizeInformation),
        text: fieldName,
      ),
    );
  }
}
