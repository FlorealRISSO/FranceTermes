import 'package:flutter/material.dart';
import 'package:france_terme/widgets/default_app_bar.dart';

import '../themes/theme_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String _title = "Paramètre";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ThemeConstants.actionsColor(context),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(_title,
            style: TextStyle(color: ThemeConstants.actionsColor(context))),
      ).getDefaultAppBar(context),
      body: Text(
        "TODO",
        style: TextStyle(color: ThemeConstants.actionsColor(context)),
      ),
    );
  }
}
