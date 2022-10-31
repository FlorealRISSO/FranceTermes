import 'package:flutter/services.dart';
import 'package:france_termes/providers/shared_preferences_provider.dart';
import 'package:xml/xml.dart';
import '../models/article.dart';
import '../parser/france_terme_parser.dart';

class LocalApi {
  static const String _filename = "data.xml";
  static const int _emptyVersion = 0;
  static final DateTime defaultDate = DateTime(2022, 09, 01);

  static Future<List<Article>> getArticlesFromAssets() async {
    return TermeParser(
            XmlDocument.parse(await rootBundle.loadString("assets/$_filename")))
        .fullParse();
  }

  static DateTime getLocalDate(SharedPreferencesProvider provider) {
    final DateTime? date = provider.getLocalDate();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static DateTime getSavedOnlineDate(SharedPreferencesProvider provider) {
    final DateTime? date = provider.getOnlineDate();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static DateTime getLastVerification(SharedPreferencesProvider provider) {
    final DateTime? date = provider.getLastVerification();
    if (date != null) {
      return date;
    }
    return defaultDate;
  }

  static void setLocalDate(DateTime date, SharedPreferencesProvider provider) {
    provider.setLocalDate(date);
  }

  static void setOnlineDate(DateTime date, SharedPreferencesProvider provider) {
    provider.setOnlineDate(date);
  }

  static void setLastVerification(SharedPreferencesProvider provider) {
    provider.setLastVerification();
  }

  static int getAppVersion(SharedPreferencesProvider provider) {
    int? appVersion = provider.getAppVersion();
    if (appVersion != null) {
      return appVersion;
    } else {
      return _emptyVersion;
    }
  }

  static void setAppVersion(
      int appVersion, SharedPreferencesProvider provider) {
    provider.setAppVersion(appVersion);
  }
}
