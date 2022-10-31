import 'package:france_termes/models/article.dart';
import 'package:france_termes/models/sub_domain.dart';
import 'package:isar/isar.dart';
part 'domain.g.dart';

@Collection()
class Domain {
  Id id = Isar.autoIncrement;

  @Backlink(to: "fields")
  IsarLinks<Article> articles = IsarLinks();
  IsarLinks<SubDomain> subFields = IsarLinks();
  @Index()
  final String field;

  Domain(this.field);

  int indexOf(String subField) {
    int pos = -1;
    int i = 0;
    for (final elem in subFields) {
      if (subField == elem.subField) {
        pos = i;
        break;
      }
      i++;
    }
    return pos;
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
