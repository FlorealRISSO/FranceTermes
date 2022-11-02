import 'package:flutter/material.dart';

import '../../themes/theme_constants.dart';

abstract class ArticleTermField extends StatelessWidget {
  const ArticleTermField({Key? key}) : super(key: key);

  List<InlineSpan>? buildSecondaries(
      BuildContext context, List<String>? secondaries) {
    if (secondaries != null) {
      final list = <InlineSpan>[];
      for (final secondary in secondaries) {
        list.add(TextSpan(
          text: " ou ",
          style: TextStyle(
            color: ThemeConstants.actionsColor(context),
            fontSize: ThemeConstants.textSizeDefault,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
          ),
          children: [
            TextSpan(
                text: secondary,
                style: TextStyle(
                  color: ThemeConstants.actionsColor(context),
                  fontSize: ThemeConstants.textSizeDefault,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ));
      }
      return list;
    }
    return null;
  }
}
