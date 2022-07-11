import 'package:flutter/material.dart';
import 'package:france_terme/providers/data_provider.dart';
import 'package:france_terme/widgets/term_research.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBar extends StatelessWidget {
  final DataProvider provider;

  const SearchBar(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _label = AppLocalizations.of(context)!.searchField;
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
                hintText: _label,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0,
                      color: ThemeConstants.itemDefaultColor(context)),
                  borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
                ),
                //fillColor: Theme.of(context).brightness == Brightness.light
                //  ? const Color(0xFFF0F0F0)
                //  : const Color(0xFF3A3A3A),
                labelText: _label),
          ),
        ));
  }
}
