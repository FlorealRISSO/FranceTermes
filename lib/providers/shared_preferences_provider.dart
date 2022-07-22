import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static const String _localDate = "localDate";
  static const String _lastVerification = "lastVerification";
  static const String _onlineDate = "onlineDate";
  late final Future<SharedPreferences> futurePrefs;
  SharedPreferencesProvider() {
    futurePrefs = SharedPreferences.getInstance();
  }

  static int dateToInt(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime intToDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  Future<DateTime?> getLocalDate() async {
    final SharedPreferences prefs = await futurePrefs;
    final int? intLocalDate = prefs.getInt(_localDate);
    return intLocalDate != null ? intToDate(intLocalDate) : null;
  }

  Future<void> setLocalDate(DateTime localDate) async {
    final SharedPreferences prefs = await futurePrefs;
    await prefs.setInt(_localDate, dateToInt(localDate));
    return;
  }

  Future<DateTime?> getOnlineDate() async {
    final SharedPreferences prefs = await futurePrefs;
    final int? intLocalDate = prefs.getInt(_onlineDate);
    return intLocalDate != null ? intToDate(intLocalDate) : null;
  }

  Future<void> setOnlineDate(DateTime onlineDate) async {
    final SharedPreferences prefs = await futurePrefs;
    await prefs.setInt(_onlineDate, dateToInt(onlineDate));
    return;
  }

  Future<DateTime?> getLastVerification() async {
    final SharedPreferences prefs = await futurePrefs;
    final int? lastVerification = prefs.getInt(_lastVerification);
    return lastVerification != null ? intToDate(lastVerification) : null;
  }

  Future<void> setLastVerification() async {
    final SharedPreferences prefs = await futurePrefs;
    final int date = dateToInt(DateTime.now());
    await prefs.setInt(_lastVerification, date);
  }
}
