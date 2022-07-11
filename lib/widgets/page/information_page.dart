import 'package:flutter/material.dart';

import '../default_app_bar.dart';
import '../themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);
  static const String _title = "Information";
  static const String _authorField = """Floréal Risso
Github : @FlorealRISSO 
Mail : exemple@mail.com
  """;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations textProvider = AppLocalizations.of(context)!;
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
      body: ListView(
        children: [
          ListTile(
            title: Text(textProvider.about),
            subtitle: SelectableText(textProvider.aboutText),
          ),
          ListTile(
            title: Text(textProvider.legalDisclaimer),
            subtitle: SelectableText(textProvider.legalDisclaimerText),
          ),
          ListTile(
            title: Text(textProvider.author),
            subtitle: const SelectableText(_authorField),
          ),
        ],
      ),
    );
  }
}
