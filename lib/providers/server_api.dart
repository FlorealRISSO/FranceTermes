import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'dart:io';

/// `ServerApi`is a static class for get the last version of the data.
class ServerApi {
  static const String stableMetadataUrl =
      "https://www.data.gouv.fr/api/1/datasets/5af120f2b595087cfabcde86/";

  @Deprecated(
      "Should not be use, it's for the parsing of the result from the data.culture.gouv.fr API.")
  static const String stableMetadataUrlOld =
      "https://data.culture.gouv.fr/api/v2/catalog/datasets/base-franceterme-termes-scientifiques-et-techniques";
  static const String stableDataUrl =
      "https://www.data.gouv.fr/fr/datasets/r/4e1b0ebe-e40f-4ce2-beaa-ac5a60d20899";

  @Deprecated(
      "Should not be use, it's for the parsing of the result from the data.culture.gouv.fr API.")
  // ignore: unused_element
  static String _parseDateOld(dynamic json) {
    final String lastmodified = json['dataset']['metas']['default']['modified'];
    final String dataProcessed =
        json['dataset']['metas']['default']['data_processed'];
    final int compareResult = lastmodified.compareTo(dataProcessed);
    return compareResult >= 0 ? lastmodified : dataProcessed;
  }

  static String _parseDate(dynamic json) {
    final String lastmodified = json["last_modified"];
    final String lastupdate = json['last_update'];
    final int compareResult = lastmodified.compareTo(lastupdate);
    return compareResult >= 0 ? lastmodified : lastupdate;
  }

  /// Retrieve the date of the last update
  static Future<DateTime> getOnlineDate() async {
    final req = await http.Client().get(Uri.parse(stableMetadataUrl));
    final jsonFile = await json.decode(req.body);
    final String strDate = _parseDate(jsonFile);
    final DateTime dateTime = DateTime.parse(strDate);
    return dateTime;
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Return the xml File
  static Future<String> downloadData() async {
    final response = await http.Client().get(Uri.parse(stableDataUrl));
    return utf8.decode(response.bodyBytes);
  }
}
