import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/widgets/term_research.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBar extends StatelessWidget {
  final DataProvider provider;

  const SearchBar(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String label = AppLocalizations.of(context)!.searchField;
    return GestureDetector(
        onTap: () =>
            showSearch(context: context, delegate: TermResearch(provider)),
        behavior: HitTestBehavior.opaque,
        child: IgnorePointer(
          child: TextField(
            autofocus: false,
            readOnly: true,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: label,
                filled: true,
                fillColor: ThemeConstants.itemDefaultColor(context),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0,
                      color: ThemeConstants.itemDefaultColor(context)),
                  borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
                ),
                labelText: label),
          ),
        ));
  }
}
