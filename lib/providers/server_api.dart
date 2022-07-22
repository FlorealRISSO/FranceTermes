import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'dart:io';

/// `ServerApi`is a static class for get the last version of the data.
class ServerApi {
  static const String stableMetadataUrl =
      "https://data.culture.gouv.fr/api/v2/catalog/datasets/base-franceterme-termes-scientifiques-et-techniques";
  static const String stableDataUrl =
      "https://www.data.gouv.fr/fr/datasets/r/4e1b0ebe-e40f-4ce2-beaa-ac5a60d20899";

  static String _parseDate(dynamic json) {
    final String lastmodified = json['dataset']['metas']['default']['modified'];
    final String dataProcessed =
        json['dataset']['metas']['default']['data_processed'];
    final int compareResult = lastmodified.compareTo(dataProcessed);
    return compareResult >= 0 ? lastmodified : dataProcessed;
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
