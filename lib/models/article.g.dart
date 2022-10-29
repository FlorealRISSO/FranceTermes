// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetArticleCollection on Isar {
  IsarCollection<Article> get articles => this.collection();
}

const ArticleSchema = CollectionSchema(
  name: r'Article',
  id: 9049022761614856892,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'definition': PropertySchema(
      id: 1,
      name: r'definition',
      type: IsarType.string,
    ),
    r'domains': PropertySchema(
      id: 2,
      name: r'domains',
      type: IsarType.stringList,
    ),
    r'getUrl': PropertySchema(
      id: 3,
      name: r'getUrl',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.string,
    ),
    r'numero': PropertySchema(
      id: 6,
      name: r'numero',
      type: IsarType.string,
    ),
    r'source': PropertySchema(
      id: 7,
      name: r'source',
      type: IsarType.string,
    ),
    r'toQuestion': PropertySchema(
      id: 8,
      name: r'toQuestion',
      type: IsarType.string,
    ),
    r'toSeeId': PropertySchema(
      id: 9,
      name: r'toSeeId',
      type: IsarType.longList,
    ),
    r'warning': PropertySchema(
      id: 10,
      name: r'warning',
      type: IsarType.string,
    )
  },
  estimateSize: _articleEstimateSize,
  serialize: _articleSerialize,
  deserialize: _articleDeserialize,
  deserializeProp: _articleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'terms': LinkSchema(
      id: -5634372111824860705,
      name: r'terms',
      target: r'Term',
      single: false,
      linkName: r'article',
    )
  },
  embeddedSchemas: {},
  getId: _articleGetId,
  getLinks: _articleGetLinks,
  attach: _articleAttach,
  version: '3.0.2',
);

int _articleEstimateSize(
  Article object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.definition.length * 3;
  bytesCount += 3 + object.domains.length * 3;
  {
    for (var i = 0; i < object.domains.length; i++) {
      final value = object.domains[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.getUrl.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.numero.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.toQuestion.length * 3;
  bytesCount += 3 + object.toSeeId.length * 8;
  bytesCount += 3 + object.warning.length * 3;
  return bytesCount;
}

void _articleSerialize(
  Article object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.definition);
  writer.writeStringList(offsets[2], object.domains);
  writer.writeString(offsets[3], object.getUrl);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeString(offsets[5], object.notes);
  writer.writeString(offsets[6], object.numero);
  writer.writeString(offsets[7], object.source);
  writer.writeString(offsets[8], object.toQuestion);
  writer.writeLongList(offsets[9], object.toSeeId);
  writer.writeString(offsets[10], object.warning);
}

Article _articleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Article(
    id,
    reader.readString(offsets[6]),
    reader.readDateTime(offsets[0]),
    reader.readString(offsets[1]),
    reader.readStringList(offsets[2]) ?? [],
    reader.readLongList(offsets[9]) ?? [],
    reader.readString(offsets[5]),
    reader.readString(offsets[7]),
    reader.readString(offsets[10]),
    reader.readString(offsets[8]),
  );
  return object;
}

P _articleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLongList(offset) ?? []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _articleGetId(Article object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _articleGetLinks(Article object) {
  return [object.terms];
}

void _articleAttach(IsarCollection<dynamic> col, Id id, Article object) {
  object.terms.attach(col, col.isar.collection<Term>(), r'terms', id);
}

extension ArticleQueryWhereSort on QueryBuilder<Article, Article, QWhere> {
  QueryBuilder<Article, Article, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ArticleQueryWhere on QueryBuilder<Article, Article, QWhereClause> {
  QueryBuilder<Article, Article, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Article, Article, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idBetween(
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
}

extension ArticleQueryFilter
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'definition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'definition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'definition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definition',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'definition',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      domainsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'domains',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      domainsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'domains',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      domainsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domains',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      domainsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'domains',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      domainsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'getUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'getUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'getUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'getUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numero',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numero',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numero',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numero',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toQuestion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toQuestion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toSeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      toSeeIdElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toSeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toSeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toSeeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition>
      toSeeIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'toSeeId',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warning',
        value: '',
      ));
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warning',
        value: '',
      ));
    });
  }
}

extension ArticleQueryObject
    on QueryBuilder<Article, Article, QFilterCondition> {}

extension ArticleQueryLinks
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> terms(
      FilterQuery<Term> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'terms');
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'terms', length, true, length, true);
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'terms', 0, true, 0, true);
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'terms', 0, false, 999999, true);
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'terms', 0, true, length, include);
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'terms', length, include, 999999, true);
    });
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> termsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'terms', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ArticleQuerySortBy on QueryBuilder<Article, Article, QSortBy> {
  QueryBuilder<Article, Article, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDefinition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'definition', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDefinitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'definition', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByGetUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getUrl', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByGetUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getUrl', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByToQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toQuestion', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByToQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toQuestion', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByWarning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warning', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByWarningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warning', Sort.desc);
    });
  }
}

extension ArticleQuerySortThenBy
    on QueryBuilder<Article, Article, QSortThenBy> {
  QueryBuilder<Article, Article, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDefinition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'definition', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDefinitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'definition', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByGetUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getUrl', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByGetUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getUrl', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByToQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toQuestion', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByToQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toQuestion', Sort.desc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByWarning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warning', Sort.asc);
    });
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByWarningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warning', Sort.desc);
    });
  }
}

extension ArticleQueryWhereDistinct
    on QueryBuilder<Article, Article, QDistinct> {
  QueryBuilder<Article, Article, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByDefinition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'definition', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByDomains() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'domains');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByGetUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'getUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByNumero(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByToQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toQuestion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByToSeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toSeeId');
    });
  }

  QueryBuilder<Article, Article, QDistinct> distinctByWarning(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warning', caseSensitive: caseSensitive);
    });
  }
}

extension ArticleQueryProperty
    on QueryBuilder<Article, Article, QQueryProperty> {
  QueryBuilder<Article, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Article, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> definitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'definition');
    });
  }

  QueryBuilder<Article, List<String>, QQueryOperations> domainsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'domains');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> getUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'getUrl');
    });
  }

  QueryBuilder<Article, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> numeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> toQuestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toQuestion');
    });
  }

  QueryBuilder<Article, List<int>, QQueryOperations> toSeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toSeeId');
    });
  }

  QueryBuilder<Article, String, QQueryOperations> warningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warning');
    });
  }
}
