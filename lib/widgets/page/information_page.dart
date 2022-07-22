import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../default_app_bar.dart';
import '../themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);
  static const String _title = "Information";
  static const String _authorField = """Floréal Risso
Github : @FlorealRISSO 
Mail : contact@flris.fr
  """;
  static const String _gitUrl = "francetermes.flris.fr";
  static const String _mail = "contact@flris.fr";
  static const String _dataset =
      "https://data.culture.gouv.fr/explore/dataset/base-franceterme-termes-scientifiques-et-techniques/information/";
  static const String _website = "http://www.culture.fr/franceterme";
  _setClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text)).then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)))
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations textProvider = AppLocalizations.of(context)!;
    final String urlMessage = textProvider.copyInformation;
    final String mailMessage = textProvider.mailInformation;
    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
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
          ListTile(
              title: TextButton(
                  onPressed: (() =>
                      _setClipboard(context, _gitUrl, urlMessage)),
                  child: Text(textProvider.sourceCode))),
          ListTile(
            title: TextButton(
              onPressed: (() => _setClipboard(context, _mail, mailMessage)),
              child: const Text("Mail"),
            ),
          ),
          ListTile(
            title: TextButton(
              onPressed: (() => _setClipboard(context, _dataset, urlMessage)),
              child: Text(textProvider.dataset),
            ),
          ),
          ListTile(
            title: TextButton(
              onPressed: (() => _setClipboard(context, _website, urlMessage)),
              child: Text(textProvider.website),
            ),
          )
        ],
      ),
    );
  }
}
