import 'package:flutter/material.dart';
import 'package:france_terme/providers/data_provider.dart';
import 'package:france_terme/widgets/default_app_bar.dart';
import 'package:france_terme/widgets/france_term_text.dart';
import 'package:france_terme/widgets/page/information_page.dart';
import 'package:france_terme/widgets/sliding_segmented_home.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';
import '../laucher.dart';
import '../route_builder/slide_right_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildContent(DataProvider provider) {
    return SlidingSegmentedHome(provider);
  }

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
          /*actions: [
            IconButton(
                color: iconColor,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage())),
                icon: const Icon(Icons.settings)),
          ],*/
          title: const FranceTermeText(),
        ).getDefaultAppBar(context),
        body: const FutureDataProvider());
  }
}
