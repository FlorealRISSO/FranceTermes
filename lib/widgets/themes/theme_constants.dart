import 'package:flutter/material.dart';

class LightConstants {
  static const Color itemDefaultColor = Color(0xFFF0F0F0);
  static const Color articlePreviewColor = itemDefaultColor;
  static const Color slindingSegmentSelectedColor = Color(0xFFD0D0D0);
  static const Color articleInternalCardColor = Color(0xFFFFFFFF);
  static const Color actionsColor = Color(0xFF000000);
}

class DarkConstants {
  static const Color itemDefaultColor = Color(0xFF3A3A3A);
  static const Color articlePreviewColor = itemDefaultColor;
  static const Color slindingSegmentSelectedColor = Color(0xFF707070);
  static const Color articleInternalCardColor = Color(0xFF303030);
  static const Color actionsColor = Color(0xFFFFFFFF);
}

class ThemeConstants {
  static const double textSizeDefault = 20;
  static const double textSizeInformation = 15;
  static const double cardPadding = 8;
  static const TextStyle textStyleDefault = TextStyle(
    fontSize: textSizeDefault,
  );

  static TextStyle coloredTextStyleDefault(BuildContext context) {
    return TextStyle(
      fontSize: textSizeDefault,
      color: Theme.of(context).brightness == Brightness.light
          ? LightConstants.actionsColor
          : DarkConstants.actionsColor,
    );
  }

  static Padding internalSymetricPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: child,
    );
  }

  static Padding externalSymetricPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: child,
    );
  }

  static BorderRadius itemDefaultBorderRaduis() {
    return BorderRadius.circular(10);
  }

  static Color actionsColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? LightConstants.actionsColor
        : DarkConstants.actionsColor;
  }

  static Color itemDefaultColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? LightConstants.itemDefaultColor
        : DarkConstants.itemDefaultColor;
  }

  static Color articlePreviewColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? LightConstants.articlePreviewColor
        : DarkConstants.articlePreviewColor;
  }

  static Color slindingColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? LightConstants.slindingSegmentSelectedColor
        : DarkConstants.slindingSegmentSelectedColor;
  }

  static Color articleInternalCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? LightConstants.articleInternalCardColor
        : DarkConstants.articleInternalCardColor;
  }

  static Widget coloredCircularProgressIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: actionsColor(context),
      ),
    );
  }
}
