import 'package:france_termes/models/article.dart';
import 'package:isar/isar.dart';
part 'domain.g.dart';

@Collection()
class Domain {
  Id id = Isar.autoIncrement;

  @Backlink(to: "domains")
  IsarLinks<Article> articles = IsarLinks();
  @Index()
  final String field;
  final List<String> subFields;

  Domain(this.field, this.subFields);

  int putIfAbsent(String subField) {
    if (!subFields.contains(subField)) {
      subFields.add(subField);
      return subFields.length - 1;
    } else {
      return subFields.indexOf(subField);
    }
  }

  @override
  String toString() {
    final String separator = subFields.isNotEmpty ? " / " : "";
    return "$field$separator${subFields.join(' / ')}";
  }

  @override
  int get hashCode => field.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Domain &&
          runtimeType == other.runtimeType &&
          field == other.field;
}
