import 'package:flutter/services.dart';
import 'package:france_termes/providers/shared_preferences_provider.dart';
import 'package:xml/xml.dart';
import '../models/article.dart';
import '../parser/france_terme_parser.dart';

class LocalApi {
  static const String filename = "data.xml";
  static final DateTime defaultDate = DateTime(2022, 05, 28);

  static Future<List<Article>> getArticlesFromAssets() async {
    return TermeParser(
            XmlDocument.parse(await rootBundle.loadString("assets/$filename")))
        .fullParse();
  }

  static Future<DateTime> getLocalDate(
      SharedPreferencesProvider provider) async {
    final DateTime? date = await provider.getLocalDate();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static Future<DateTime> getSavedOnlineDate(
      SharedPreferencesProvider provider) async {
    final DateTime? date = await provider.getOnlineDate();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static Future<DateTime> getLastVerification(
      SharedPreferencesProvider provider) async {
    final DateTime? date = await provider.getLastVerification();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static Future<void> setLocalDate(DateTime date) async {
    await SharedPreferencesProvider().setLocalDate(date);
  }

  static Future<void> setOnlineDate(
      DateTime date, SharedPreferencesProvider provider) async {
    await provider.setOnlineDate(date);
  }

  static Future<void> setLastVerification(
      SharedPreferencesProvider provider) async {
    await provider.setLastVerification();
  }
}
