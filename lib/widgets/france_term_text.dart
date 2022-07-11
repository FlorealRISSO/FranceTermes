import 'package:flutter/material.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';

class FranceTermeText extends StatelessWidget {
  static const Color franceColor = Color.fromRGBO(25, 170, 245, 1);
  static const Color termColor = Color.fromRGBO(228, 10, 131, 1);
  final double fontSize;
  const FranceTermeText({Key? key, this.fontSize = 40}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textColor = ThemeConstants.actionsColor(context);
    final text = RichText(
      text: TextSpan(
          text: "FranceTerme",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: textColor,
            //color: franceColor
          )),
    );
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: text,
    );
  }
}
