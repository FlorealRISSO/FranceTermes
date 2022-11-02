import 'package:diacritic/diacritic.dart' as diacritic;

extension QueryStringExtension on String {
  bool startsWithUnsensitive(String other) {
    return toUpperCase().startsWith(other.toUpperCase());
  }

  String removeDiacritics() {
    return diacritic.removeDiacritics(this);
  }
}
