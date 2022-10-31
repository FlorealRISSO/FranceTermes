import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/providers/shared_preferences_provider.dart';
import 'package:france_termes/widgets/page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences =
      await SharedPreferencesProvider.getSharedPreferences();
  SharedPreferencesProvider preferencesProvider =
      SharedPreferencesProvider(sharedPreferences);

  Isar isar = await DataProvider.openIsar();
  DataProvider provider = DataProvider(isar, preferencesProvider);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(FranceTermesApp(provider));
  });
}

class FranceTermesApp extends StatelessWidget {
  static const String _title = 'France Termes';
  final DataProvider provider;
  const FranceTermesApp(this.provider, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomePage(provider),
    );
  }
}
