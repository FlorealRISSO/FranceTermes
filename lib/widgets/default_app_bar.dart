import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAppBar {
  final Widget? leading;
  final List<Widget>? actions;
  final Widget title;

  DefaultAppBar({Key? key, this.leading, this.actions, required this.title});

  AppBar getDefaultAppBar(final BuildContext context) {
    return AppBar(
        leading: leading,
        actions: actions,
        title: title,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light);
  }
}
