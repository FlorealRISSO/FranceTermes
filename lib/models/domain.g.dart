// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDomainCollection on Isar {
  IsarCollection<Domain> get domains => this.collection();
}

const DomainSchema = CollectionSchema(
  name: r'Domain',
  id: -6135609459731946152,
  properties: {
    r'field': PropertySchema(
      id: 0,
      name: r'field',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    )
  },
  estimateSize: _domainEstimateSize,
  serialize: _domainSerialize,
  deserialize: _domainDeserialize,
  deserializeProp: _domainDeserializeProp,
  idName: r'id',
  indexes: {
    r'field': IndexSchema(
      id: 2359414177044990521,
      name: r'field',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'field',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'articles': LinkSchema(
      id: 8598259593155327081,
      name: r'articles',
      target: r'Article',
      single: false,
      linkName: r'fields',
    ),
    r'subFields': LinkSchema(
      id: 6784378821952482895,
      name: r'subFields',
      target: r'SubDomain',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _domainGetId,
  getLinks: _domainGetLinks,
  attach: _domainAttach,
  version: '3.0.0',
);

int _domainEstimateSize(
  Domain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.field.length * 3;
  return bytesCount;
}

void _domainSerialize(
  Domain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.field);
  writer.writeLong(offsets[1], object.hashCode);
}

Domain _domainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Domain(
    reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _domainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _domainGetId(Domain object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _domainGetLinks(Domain object) {
  return [object.articles, object.subFields];
}

void _domainAttach(IsarCollection<dynamic> col, Id id, Domain object) {
  object.id = id;
  object.articles.attach(col, col.isar.collection<Article>(), r'articles', id);
  object.subFields
      .attach(col, col.isar.collection<SubDomain>(), r'subFields', id);
}

extension DomainQueryWhereSort on QueryBuilder<Domain, Domain, QWhere> {
  QueryBuilder<Domain, Domain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DomainQueryWhere on QueryBuilder<Domain, Domain, QWhereClause> {
  QueryBuilder<Domain, Domain, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> fieldEqualTo(String field) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'field',
        value: [field],
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterWhereClause> fieldNotEqualTo(
      String field) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'field',
              lower: [],
              upper: [field],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'field',
              lower: [field],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'field',
              lower: [field],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'field',
              lower: [],
              upper: [field],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DomainQueryFilter on QueryBuilder<Domain, Domain, QFilterCondition> {
  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'field',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'field',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'field',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'field',
        value: '',
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> fieldIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'field',
        value: '',
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DomainQueryObject on QueryBuilder<Domain, Domain, QFilterCondition> {}

extension DomainQueryLinks on QueryBuilder<Domain, Domain, QFilterCondition> {
  QueryBuilder<Domain, Domain, QAfterFilterCondition> articles(
      FilterQuery<Article> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'articles');
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'articles', length, true, length, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'articles', 0, true, 0, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'articles', 0, false, 999999, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'articles', 0, true, length, include);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'articles', length, include, 999999, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> articlesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'articles', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFields(
      FilterQuery<SubDomain> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'subFields');
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFieldsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subFields', length, true, length, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFieldsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subFields', 0, true, 0, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFieldsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subFields', 0, false, 999999, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFieldsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subFields', 0, true, length, include);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition>
      subFieldsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subFields', length, include, 999999, true);
    });
  }

  QueryBuilder<Domain, Domain, QAfterFilterCondition> subFieldsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'subFields', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DomainQuerySortBy on QueryBuilder<Domain, Domain, QSortBy> {
  QueryBuilder<Domain, Domain, QAfterSortBy> sortByField() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'field', Sort.asc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> sortByFieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'field', Sort.desc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }
}

extension DomainQuerySortThenBy on QueryBuilder<Domain, Domain, QSortThenBy> {
  QueryBuilder<Domain, Domain, QAfterSortBy> thenByField() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'field', Sort.asc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> thenByFieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'field', Sort.desc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Domain, Domain, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DomainQueryWhereDistinct on QueryBuilder<Domain, Domain, QDistinct> {
  QueryBuilder<Domain, Domain, QDistinct> distinctByField(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'field', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Domain, Domain, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }
}

extension DomainQueryProperty on QueryBuilder<Domain, Domain, QQueryProperty> {
  QueryBuilder<Domain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Domain, String, QQueryOperations> fieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'field');
    });
  }

  QueryBuilder<Domain, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }
}
