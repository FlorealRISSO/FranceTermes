import 'dart:math';

import 'package:france_terme/models/article.dart';
import 'package:france_terme/models/term.dart';
import 'package:france_terme/parser/france_terme_parser.dart';
import 'package:france_terme/providers/server_api.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';
import 'package:xml/xml.dart';

import 'assets_api.dart';

class DataProvider {
  static const int minArticles = 100;
  final Isar isar;
  int? termsSize;
  int? articlesSize;

  DataProvider(this.isar);

  static bool _isGreaterOrEqual(DateTime currentDate, DateTime lastModified) {
    return currentDate.compareTo(lastModified) >= 0;
  }

  /// When the server is not accessible, returns true by default
  static Future<Tuple2<bool, DateTime>> isUpToDate() async {
    final DateTime localDate = await AssetsApi.getLocalDate();
    try {
      final DateTime onlineDate = await ServerApi.getOnlineDate();
      bool isUpToDate = _isGreaterOrEqual(localDate, onlineDate);
      return Tuple2(isUpToDate, onlineDate);
    } catch (_) {
      return Tuple2(true, localDate);
    }
  }

  bool isInit() {
    articlesSize ??= isar.articles.countSync();
    return articlesSize! > minArticles;
  }

  static Future<Isar> openIsar() async {
    Isar isar = await Isar.open(
        schemas: [ArticleSchema, TermSchema],
        directory: (await getApplicationDocumentsDirectory()).path,
        inspector: false);
    return isar;
  }

  static Future<DataProvider> getDataProvider(Future<Isar> isar) async {
    return DataProvider(await isar);
  }

  /// To ensure the safety this fonction
  /// should be use instead of `_feed()`
  Future<bool> update(List<Article> articles) async {
    await _clear();
    await _feed(articles);
    return true;
  }

  Future<List<Term>> searchWords(String query) async {
    final List<Term> terms = await isar.terms
        .filter()
        .simplifiedStartsWith(query, caseSensitive: false)
        .or()
        .wordStartsWith(query, caseSensitive: false)
        .or()
        .variantWordsAnyStartsWith(query, caseSensitive: false)
        .findAll();
    return terms;
  }

  Future<List<Article>> searchArticles(String query) async {
    final List<Term> terms = await isar.terms
        .filter()
        .simplifiedStartsWith(query, caseSensitive: false)
        .or()
        .wordStartsWith(query, caseSensitive: false)
        .or()
        .variantWordsAnyStartsWith(query, caseSensitive: false)
        .findAll();
    Set<Article> articles = {};
    for (final Term term in terms) {
      await term.article.load();
      articles.add(term.article.value!);
    }
    for (final Article article in articles) {
      await article.terms.load();
    }
    return articles.toList();
  }

  Future<List<Article>> getNewArticles(int number) async {
    final List<Article> articles = await isar.articles
        .filter()
        .dateGreaterThan(DateTime(2010))
        .sortByDateDesc()
        .limit(20)
        .findAll();
    for (final Article article in articles) {
      await article.terms.load();
    }
    return articles;
  }

  Future<List<Article>> getRandomActicles(int number) async {
    assert(number >= 0);
    termsSize ??= await isar.terms.count();
    List<int> index = [];
    for (int i = 0; i < number; i++) {
      index.add(Random.secure().nextInt(termsSize! - 1));
    }
    final List<Term?> terms = await isar.terms.getAll(index);
    final List<Article> articles = [];
    for (final Term? term in terms) {
      if (term != null) {
        await term.article.load();
        articles.add(term.article.value!);
      }
    }
    for (Article article in articles) {
      await article.terms.load();
    }
    return articles;
  }

  Future<List<Article>> getArticles(List<int> index) async {
    List<Article?> possibleArticles =
        await isar.txn((isar) => isar.articles.getAll(index));
    List<Article> articles = [];
    for (Article? article in possibleArticles) {
      if (article != null) {
        await article.terms.load();
        articles.add(article);
      }
    }
    return articles;
  }

  Future<void> _feed(List<Article> articles) async {
    await isar.writeTxn((isar) => isar.articles.putAll(
          articles,
          replaceOnConflict: true,
          saveLinks: true,
        ));
  }

  Future<void> _clear() async {
    isar.writeTxn((isar) => isar.clear());
  }

  Future<void> updateFromDownload(DateTime lastVersion) async {
    try {
      String strFile = await ServerApi.downloadData();
      await AssetsApi.setLocalDate(lastVersion);
      final XmlDocument xmlFile = XmlDocument.parse(strFile);
      List<Article> articles = TermeParser(xmlFile).fullParse();
      await update(articles);
    } catch (_) {
      if (isInit()) {
        return;
      } else {
        await updateFromAsset();
        return;
      }
    }
  }

  Future<void> updateFromAsset() async {
    final List<Article> articles = await AssetsApi.getArticlesFromAssets();
    await update(articles);
  }
}
