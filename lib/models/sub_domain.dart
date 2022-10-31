import 'package:france_termes/models/domain.dart';
import 'package:isar/isar.dart';
part 'sub_domain.g.dart';

@Collection()
class SubDomain {
  Id id = Isar.autoIncrement;
  final String subField;
  @Backlink(to: 'subFields')
  final IsarLink<Domain> field = IsarLink();
  SubDomain(this.subField);

  @override
  String toString() {
    return subField;
  }

  @override
  int get hashCode => subField.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubDomain &&
          runtimeType == other.runtimeType &&
          subField == other.subField;
}
