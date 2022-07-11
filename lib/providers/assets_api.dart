import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/article.dart';
import '../parser/france_terme_parser.dart';

class AssetsApi {
  static const String filename = "data.xml";

  /// The version of the asset embeded...
  static final DateTime defaultDate = DateTime(2022, 05, 28);
  static const String valueName = "localDate";

  static Future<List<Article>> getArticlesFromAssets() async {
    return TermeParser(
            XmlDocument.parse(await rootBundle.loadString("assets/$filename")))
        .fullParse();
  }

  static Future<DateTime> getLocalDate() async {
    final prefs = await SharedPreferences.getInstance();
    final int? intLocalDate = prefs.getInt(valueName);
    if (intLocalDate != null) {
      return DateTime.fromMillisecondsSinceEpoch(intLocalDate);
    }
    return defaultDate;
  }

  static Future<void> setLocalDate(DateTime localDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(valueName, localDate.millisecondsSinceEpoch);
    return;
  }
}
