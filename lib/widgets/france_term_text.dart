import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

class TextFranceTermes extends StatelessWidget {
  const TextFranceTermes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textColor = ThemeConstants.actionsColor(context);
    return Text(
      "France Termes",
      style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: textColor,
        //color: franceColor
      ),
    );
  }
}
