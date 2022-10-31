import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/widgets/article_preview/article_preview.dart';
import 'package:france_termes/widgets/article/articles_view.dart';
import 'package:france_termes/widgets/default_app_bar.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:ui' as ui;

import '../../models/article.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  final DataProvider provider;
  final GlobalKey _globalKey = GlobalKey();

  ArticlePage(this.article, this.provider, {Key? key}) : super(key: key);
  _setClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: article.getUrl)).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppLocalizations.of(context)!.copyInformation)))
        });
  }

  Future<String> _saveImage() async {
    final String tempFileName = "/terme_${article.id}.png";
    RenderRepaintBoundary? boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image data = await boundary.toImage();
    final ByteData? bytes =
        await data.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    final tmp = await getTemporaryDirectory();
    final path = tmp.path + tempFileName;
    var file = File(path).writeAsBytes(imageBytes);
    return file.then((value) => path).onError(
        (error, stackTrace) => Future<String>.error(error!, stackTrace));
  }

  void _toImage() {
    Future<String> path = _saveImage();
    path.then((String path) {
      Share.shareFiles([path]);
    });
  }

  Widget _shareButton(BuildContext context, GlobalKey key) {
    return IconButton(
      icon: const Icon(Icons.image),
      onPressed: _toImage,
      color: ThemeConstants.actionsColor(context),
    );
  }

  Widget _buildFuturePreview() {
    return FutureBuilder(
      future: provider.getArticles(article.toSeeId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.requireData! as List<Article>;
          return Column(
            children: articles
                .map((article) => ArticlePreview(article, provider))
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text(
              AppLocalizations.of(context)!.errorMessage); //TODO: change it...
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateInformation = AppLocalizations.of(context)!.dateInformation;
    final date = Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "$dateInformation ${DateFormat.yMd('fr').format(article.date)}",
              textAlign: TextAlign.right,
            )));
    List<Widget> children = [
      RepaintBoundary(key: _globalKey, child: ArticleView(article)),
      date,
    ];
    if (article.toSeeId.isNotEmpty) {
      children.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(AppLocalizations.of(context)!.seeAlso)));
    }

    children.add(_buildFuturePreview());

    return Scaffold(
        appBar: DefaultAppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.adaptive.arrow_back,
                  color: ThemeConstants.actionsColor(context))),
          title: Text("Article",
              style: TextStyle(color: ThemeConstants.actionsColor(context))),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                icon: Icon(Icons.home,
                    color: ThemeConstants.actionsColor(context))),
            _shareButton(context, _globalKey),
            IconButton(
              onPressed: () => _setClipboard(context),
              icon: const Icon(Icons.link),
              color: ThemeConstants.actionsColor(context),
            ),
          ],
        ).getDefaultAppBar(context),
        body: ListView(
          children: children,
        ));
  }
}
