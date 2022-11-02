import 'package:diacritic/diacritic.dart' as diacritic;

extension QueryStringExtension on String {
  bool startsWithUnsensitive(String other) {
    return toUpperCase().startsWith(other.toUpperCase());
  }

  String toUpperAscii() {
    return toUpperCase().removeDiacritics();
  }

  bool startsWithUAscii(String other) {
    return toUpperCase().removeDiacritics().startsWith(other);
  }

  String removeDiacritics() {
    return diacritic.removeDiacritics(this);
  }
}
