import 'package:flutter/material.dart';
import 'package:france_termes/widgets/article/article_field/article_text_field.dart';

import '../../themes/theme_constants.dart';

class ArticleTextCard extends StatelessWidget {
  final String text;
  const ArticleTextCard(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        semanticContainer: true,
        color: ThemeConstants.articleInternalCardColor(context),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
        ),
        child: Padding(
            padding: const EdgeInsets.all(4), child: ArticleTextField(text)),
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
