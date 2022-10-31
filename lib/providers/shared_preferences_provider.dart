import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static const String _localDate = "localDate";
  static const String _lastVerification = "lastVerification";
  static const String _onlineDate = "onlineDate";
  static const String _appVersion = "appVersion";
  late final SharedPreferences futurePrefs;

  static Future<SharedPreferences> getSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  SharedPreferencesProvider(this.futurePrefs);

  static int dateToInt(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime intToDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  DateTime? getLocalDate() {
    final SharedPreferences prefs = futurePrefs;
    final int? intLocalDate = prefs.getInt(_localDate);
    return intLocalDate != null ? intToDate(intLocalDate) : null;
  }

  void setLocalDate(DateTime localDate) {
    final SharedPreferences prefs = futurePrefs;
    prefs.setInt(_localDate, dateToInt(localDate));
    return;
  }

  DateTime? getOnlineDate() {
    final SharedPreferences prefs = futurePrefs;
    final int? intLocalDate = prefs.getInt(_onlineDate);
    return intLocalDate != null ? intToDate(intLocalDate) : null;
  }

  void setOnlineDate(DateTime onlineDate) {
    final SharedPreferences prefs = futurePrefs;
    prefs.setInt(_onlineDate, dateToInt(onlineDate));
    return;
  }

  DateTime? getLastVerification() {
    final SharedPreferences prefs = futurePrefs;
    final int? lastVerification = prefs.getInt(_lastVerification);
    return lastVerification != null ? intToDate(lastVerification) : null;
  }

  void setLastVerification() {
    final SharedPreferences prefs = futurePrefs;
    final int date = dateToInt(DateTime.now());
    prefs.setInt(_lastVerification, date);
  }

  int? getAppVersion() {
    final SharedPreferences prefs = futurePrefs;
    final int? appVersion = prefs.getInt(_appVersion);
    return appVersion;
  }

  void setAppVersion(int appVersion) {
    final SharedPreferences prefs = futurePrefs;
    prefs.setInt(_appVersion, appVersion);
  }
}
