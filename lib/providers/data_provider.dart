import 'dart:math';

import 'package:france_termes/models/article.dart';
import 'package:france_termes/models/domain.dart';
import 'package:france_termes/models/sub_domain.dart';
import 'package:france_termes/models/term.dart';
import 'package:france_termes/parser/france_terme_parser.dart';
import 'package:france_termes/providers/server_api.dart';
import 'package:france_termes/providers/shared_preferences_provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';
import 'package:xml/xml.dart';

import 'local_api.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class DataProvider {
  static const int _minArticles = 7000;
  static const int _appVersion = 2;
  static const int _newArticles = 50;
  static const int _minDate = 2010;
  final Isar isar;
  final SharedPreferencesProvider peferencesProvider;
  int? articlesSize;
  List<String> domains = [];

  DataProvider(this.isar, this.peferencesProvider);

  static bool _isGreaterOrEqual(DateTime currentDate, DateTime lastModified) {
    return currentDate.compareTo(lastModified) >= 0;
  }

  /// When the server is not accessible, returns true by default
  static Future<Tuple2<bool, DateTime>> isUpToDate(
      SharedPreferencesProvider provider) async {
    final DateTime localDate = LocalApi.getLocalDate(provider);
    try {
      final DateTime onlineDate = await ServerApi.getOnlineDate();
      LocalApi.setLastVerification(provider);
      LocalApi.setOnlineDate(onlineDate, provider);
      bool isUpToDate = _isGreaterOrEqual(localDate, onlineDate);
      return Tuple2(isUpToDate, onlineDate);
    } catch (_) {
      return Tuple2(true, localDate);
    }
  }

  static Future<Tuple2<bool, DateTime>> isUpdateOffline(
      SharedPreferencesProvider provider) async {
    final DateTime localDate = LocalApi.getLocalDate(provider);
    final DateTime onlineDate = LocalApi.getSavedOnlineDate(provider);
    final bool isUpToDate = _isGreaterOrEqual(localDate, onlineDate);
    if (!isUpToDate && await ServerApi.hasNetwork()) {
      return Tuple2(false, onlineDate);
    } else {
      return Tuple2(true, onlineDate);
    }
  }

  Future<Tuple2<bool, DateTime>> isUpToDateLazy() {
    DateTime? lastVerification =
        LocalApi.getLastVerification(peferencesProvider);
    if (lastVerification.isSameDay(DateTime.now())) {
      return isUpdateOffline(peferencesProvider);
    } else {
      return isUpToDate(peferencesProvider);
    }
  }

  bool isInitInOkVersion() {
    final int articlesSize = isar.articles.countSync();
    final int appVersion = LocalApi.getAppVersion(peferencesProvider);
    return (articlesSize > _minArticles) && (appVersion == _appVersion);
  }

  static Future<Isar> openIsar() async {
    Isar isar = Isar.openSync(
        [ArticleSchema, TermSchema, DomainSchema, SubDomainSchema],
        directory: (await getApplicationDocumentsDirectory()).path,
        inspector: true);
    return isar;
  }

  static DataProvider getDataProvider(
      Isar isar, SharedPreferencesProvider provider) {
    return DataProvider(isar, provider);
  }

  /// To ensure the safety this fonction
  /// should be use instead of `_feed()`
  Future<bool> update(List<Article> articles) async {
    _clear();
    _feed(articles);
    LocalApi.setAppVersion(_appVersion, peferencesProvider);
    return true;
  }

  List<Article> _getExistingArticles(List<Article?> articles) {
    final List<Article> result = [];
    for (final article in articles) {
      if (article != null) {
        result.add(article);
      }
    }
    return result;
  }

  Future<List<Article>> _loadUniqueArticles(List<Article> articles) async {
    for (final Article article in articles) {
      await article.terms.load();
      await article.fields.load();
      await article.subFields.load();
    }
    return articles;
  }

  Future<List<Article>> _loadUniqueArticlesFromTerm(List<Term> terms) async {
    Set<Article> articles = {};
    for (final Term term in terms) {
      await term.article.load();
      articles.add(term.article.value!);
    }
    return _loadUniqueArticles(articles.toList());
  }

  Future<List<Term>> searchWords(String query) async {
    final List<Term> terms = await isar.terms
        .filter()
        .simplifiedWordsUElementStartsWith(query, caseSensitive: false)
        .or()
        .simplifiedAndMasculinizedWordsUElementStartsWith(query,
            caseSensitive: false)
        .findAll();
    return terms;
  }

  Future<List<Term>> searchWordsWithFields(String query, String field) async {
    final List<Term> terms = await isar.terms
        .filter()
        .article((a) => a.fields((f) => f.fieldStartsWith(field)))
        .group((t) => t
            .simplifiedWordsUElementStartsWith(query, caseSensitive: false)
            .or()
            .simplifiedAndMasculinizedWordsUElementStartsWith(query,
                caseSensitive: false))
        .findAll();
    return terms;
  }

  Future<List<Article>> searchArticlesWithFields(
      String query, String field) async {
    final List<Term> terms = await searchWordsWithFields(query, field);
    return _loadUniqueArticlesFromTerm(terms);
  }

  Future<List<Article>> searchArticles(String query) async {
    final List<Term> terms = await searchWords(query);
    return _loadUniqueArticlesFromTerm(terms);
  }

  Future<List<Article>> getNewArticles(int number) async {
    final List<Article> articles = await isar.articles
        .filter()
        .dateGreaterThan(DateTime(_minDate))
        .sortByDateDesc()
        .limit(_newArticles)
        .findAll();
    return _loadUniqueArticles(articles);
  }

  // Attention, this function will not return n items, most of the time there will be an n*0.75.
  Future<List<Article>> getRandomActicles(int number) async {
    assert(number >= 0);
    articlesSize ??= isar.articles.countSync();
    List<int> index = [];
    Random generator = Random.secure();
    for (int i = 0; i < number; i++) {
      index.add(generator.nextInt(articlesSize! - 1));
    }
    final List<Article?> possibleArticles = await isar.articles.getAll(index);
    final List<Article> resultArticles = _getExistingArticles(possibleArticles);
    return _loadUniqueArticles(resultArticles);
  }

  Future<List<Article>> getArticles(List<int> index) async {
    List<Article?> possibleArticles = await isar.articles.getAll(index);
    final List<Article> articles = _getExistingArticles(possibleArticles);
    return _loadUniqueArticles(articles);
  }

  void _feed(List<Article> articles) {
    isar.writeTxnSync(() => isar.articles.putAllSync(articles));
  }

  void _clear() {
    isar.writeTxnSync(() => isar.clearSync());
  }

  Future<void> updateFromDownload(DateTime lastVersion) async {
    try {
      String strFile = await ServerApi.downloadData();
      LocalApi.setLocalDate(lastVersion, peferencesProvider);
      final XmlDocument xmlFile = XmlDocument.parse(strFile);
      List<Article> articles = TermeParser(xmlFile).fullParse();
      await update(articles);
    } catch (_) {
      if (isInitInOkVersion()) {
        return;
      } else {
        await updateFromAsset();
        return;
      }
    }
  }

  Future<void> updateFromAsset() async {
    final List<Article> articles = await LocalApi.getArticlesFromAssets();
    LocalApi.setLocalDate(LocalApi.defaultDate, peferencesProvider);
    await update(articles);
  }

  List<String> getDomains() {
    if (domains.length > 1) {
      return domains;
    }
    final domainsSize = isar.domains.countSync();
    //final List<String> domains = [];
    final List<int> ids = [for (var i = 1; i <= domainsSize; i += 1) i];
    final List<Domain?> possibleDomains = isar.domains.getAllSync(ids);
    for (final domain in possibleDomains) {
      if (domain != null) {
        domains.add(domain.field);
      }
    }
    domains.sort((d1, d2) => d1.compareTo(d2));
    domains.insert(0, "Tous");
    return domains;
  }
}
