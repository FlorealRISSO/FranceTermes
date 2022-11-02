import 'package:flutter/material.dart';

import '../../themes/theme_constants.dart';

class ArticlePreviewCard extends StatelessWidget {
  const ArticlePreviewCard({Key? key, required this.children})
      : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeConstants.itemDefaultColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
      ),
      child: Padding(
          padding: const EdgeInsets.all(ThemeConstants.cardPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children)),
    );
  }
}
