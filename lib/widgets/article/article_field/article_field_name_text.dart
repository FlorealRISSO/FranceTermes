import 'package:flutter/material.dart';

class ArticleFieldNameText extends StatelessWidget {
  final String fieldName;
  const ArticleFieldNameText(this.fieldName, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 15),
        text: fieldName,
      ),
    );
  }
}
