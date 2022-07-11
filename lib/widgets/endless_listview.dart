import 'package:flutter/material.dart';
import 'package:france_terme/providers/data_provider.dart';
import 'package:france_terme/widgets/article_preview/article_preview.dart';

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
  static const int loadNumber = 20;
  late final List<Article> articles = [];
  late final ScrollController controller;
  late final DataProvider provider;

  void _scrollListener() {
    if (controller.position.pixels > controller.position.maxScrollExtent / 2) {
      _addArticles();
    }
  }

  void _addArticles() async {
    List<Article> news = await provider.getNewArticles(loadNumber);
    setState(() {
      articles.addAll(news);
    });
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    provider = widget.provider;
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    for (final Article article in articles) {
      children.add(ArticlePreview(article, provider));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: provider.getRandomActicles(loadNumber),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> newArticles = snapshot.requireData as List<Article>;
            articles.addAll(newArticles);
            return ListView(
              controller: controller,
              children: _buildChildren(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
