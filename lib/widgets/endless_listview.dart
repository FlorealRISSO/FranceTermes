import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/widgets/article_preview/article_preview.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

import '../models/article.dart';

class EndlessListview extends StatefulWidget {
  final DataProvider provider;
  const EndlessListview(this.provider, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateEndlessListview();
  }
}

class StateEndlessListview extends State<EndlessListview> {
  static const int _loadNumber = 20;
  late final List<Article> _articles = [];
  late final ScrollController _controller;
  late final DataProvider _provider;

  void _scrollListener() {
    if (_controller.position.pixels >
        _controller.position.maxScrollExtent / 2) {
      _addArticles();
    }
  }

  void _addArticles() async {
    List<Article> news = await _provider.getNewArticles(_loadNumber);
    setState(() {
      _articles.addAll(news);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
    _provider = widget.provider;
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    for (final Article article in _articles) {
      children.add(ArticlePreview(article, _provider));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _provider.getRandomActicles(_loadNumber),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> newArticles = snapshot.requireData as List<Article>;
            _articles.addAll(newArticles);
            return ListView(
              controller: _controller,
              children: _buildChildren(),
            );
          } else {
            return Center(
                child:
                    ThemeConstants.coloredCircularProgressIndicator(context));
          }
        });
  }
}
