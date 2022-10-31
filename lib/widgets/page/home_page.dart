import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/providers/shared_preferences_provider.dart';
import 'package:france_termes/widgets/default_app_bar.dart';
import 'package:france_termes/widgets/france_term_text.dart';
import 'package:france_termes/widgets/page/information_page.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';
import '../laucher.dart';
import '../route_builder/slide_right_route.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.provider, {Key? key}) : super(key: key);
  final DataProvider provider;
  @override
  Widget build(BuildContext context) {
    final iconColor = ThemeConstants.actionsColor(context);
    return Scaffold(
        appBar: DefaultAppBar(
          leading: IconButton(
              color: iconColor,
              onPressed: () {
                Navigator.push(
                    context, SlideRightRoute(const InformationPage()));
              },
              icon: const Icon(Icons.info)),
          title: const TextFranceTermes(),
        ).getDefaultAppBar(context),
        body: Launcher(provider));
  }
}
