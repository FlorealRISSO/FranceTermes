import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:france_terme/providers/data_provider.dart';
import 'package:france_terme/widgets/search_bar.dart';
import 'package:france_terme/widgets/themes/theme_constants.dart';
import '../models/article.dart';
import 'article_preview/article_preview.dart';
import 'endless_listview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlidingSegmentedHome extends StatefulWidget {
  final DataProvider provider;
  const SlidingSegmentedHome(this.provider, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SlidingSegmentedHomeState();
  }
}

class _SlidingSegmentedHomeState extends State<SlidingSegmentedHome> {
  static const int _newArticle = 20;
  late final DataProvider provider;
  late final List<Widget> _sides;
  late Widget _selectedSide;
  @override
  void initState() {
    super.initState();
    provider = widget.provider;
    _sides = [
      futureNews(_newArticle),
      _buildRightTest(),
    ];
    _selectedSide = _sides[0];
    setState(() {});
  }

  Widget futureNews(int number) {
    return FutureBuilder(
        future: provider.getNewArticles(number),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData as List<Article>;
            return _buildNews(articles);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _buildNews(List<Article> articles) {
    List<Widget> children = [];
    for (Article article in articles) {
      children.add(ArticlePreview(article, provider));
    }
    return ListView(children: children);
  }

  Widget _buildRightTest() {
    return EndlessListview(provider);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SearchBar(provider)),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: CustomSlidingSegmentedControl<int>(
              isStretch: true,
              children: {
                0: Text(
                  AppLocalizations.of(context)!.news,
                  textAlign: TextAlign.center,
                ),
                1: Text(
                  AppLocalizations.of(context)!.discover,
                  textAlign: TextAlign.center,
                ),
              },
              decoration: BoxDecoration(
                color: ThemeConstants.itemDefaultColor(context),
                borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
              ),
              thumbDecoration: BoxDecoration(
                color: ThemeConstants.slindingColor(context),
                borderRadius: ThemeConstants.itemDefaultBorderRaduis(),
              ),
              onValueChanged: (value) {
                setState((() {
                  _selectedSide = _sides[value];
                }));
              },
              curve: Curves.easeInToLinear,
              controller: CustomSegmentedController(
                value: 1,
              ),
            )),
        Flexible(child: _selectedSide)
      ],
    );
  }
}
