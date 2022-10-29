// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTermCollection on Isar {
  IsarCollection<Term> get terms => this.collection();
}

const TermSchema = CollectionSchema(
  name: r'Term',
  id: -456369751537271858,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'langage': PropertySchema(
      id: 1,
      name: r'langage',
      type: IsarType.string,
    ),
    r'partOfSpeech': PropertySchema(
      id: 2,
      name: r'partOfSpeech',
      type: IsarType.string,
    ),
    r'simplified': PropertySchema(
      id: 3,
      name: r'simplified',
      type: IsarType.string,
    ),
    r'statut': PropertySchema(
      id: 4,
      name: r'statut',
      type: IsarType.long,
    ),
    r'variantTypes': PropertySchema(
      id: 5,
      name: r'variantTypes',
      type: IsarType.stringList,
    ),
    r'variantWords': PropertySchema(
      id: 6,
      name: r'variantWords',
      type: IsarType.stringList,
    ),
    r'word': PropertySchema(
      id: 7,
      name: r'word',
      type: IsarType.string,
    )
  },
  estimateSize: _termEstimateSize,
  serialize: _termSerialize,
  deserialize: _termDeserialize,
  deserializeProp: _termDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'article': LinkSchema(
      id: 2030748433031392163,
      name: r'article',
      target: r'Article',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _termGetId,
  getLinks: _termGetLinks,
  attach: _termAttach,
  version: '3.0.2',
);

int _termEstimateSize(
  Term object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.langage.length * 3;
  bytesCount += 3 + object.partOfSpeech.length * 3;
  bytesCount += 3 + object.simplified.length * 3;
  bytesCount += 3 + object.variantTypes.length * 3;
  {
    for (var i = 0; i < object.variantTypes.length; i++) {
      final value = object.variantTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.variantWords.length * 3;
  {
    for (var i = 0; i < object.variantWords.length; i++) {
      final value = object.variantWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.word.length * 3;
  return bytesCount;
}

void _termSerialize(
  Term object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.langage);
  writer.writeString(offsets[2], object.partOfSpeech);
  writer.writeString(offsets[3], object.simplified);
  writer.writeLong(offsets[4], object.statut);
  writer.writeStringList(offsets[5], object.variantTypes);
  writer.writeStringList(offsets[6], object.variantWords);
  writer.writeString(offsets[7], object.word);
}

Term _termDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Term(
    reader.readLong(offsets[4]),
    reader.readString(offsets[7]),
    reader.readStringList(offsets[5]) ?? [],
    reader.readStringList(offsets[6]) ?? [],
    reader.readString(offsets[2]),
    langage: reader.readStringOrNull(offsets[1]) ?? "fr",
  );
  return object;
}

P _termDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? "fr") as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _termGetId(Term object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _termGetLinks(Term object) {
  return [object.article];
}

void _termAttach(IsarCollection<dynamic> col, Id id, Term object) {
  object.article.attach(col, col.isar.collection<Article>(), r'article', id);
}

extension TermQueryWhereSort on QueryBuilder<Term, Term, QWhere> {
  QueryBuilder<Term, Term, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TermQueryWhere on QueryBuilder<Term, Term, QWhereClause> {
  QueryBuilder<Term, Term, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Term, Term, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idBetween(
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

extension TermQueryFilter on QueryBuilder<Term, Term, QFilterCondition> {
  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Term, Term, QAfterFilterCondition> langageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'langage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'langage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'langage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'langage',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'langage',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partOfSpeech',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partOfSpeech',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partOfSpeech',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partOfSpeech',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partOfSpeech',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'simplified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'simplified',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'simplified',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'simplified',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statut',
        value: value,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statut',
        value: value,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statut',
        value: value,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition>
      variantTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variantTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variantTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variantTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition>
      variantTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variantTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition>
      variantWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variantWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variantWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variantWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variantWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition>
      variantWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variantWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'variantWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'word',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'word',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'word',
        value: '',
      ));
    });
  }
}

extension TermQueryObject on QueryBuilder<Term, Term, QFilterCondition> {}

extension TermQueryLinks on QueryBuilder<Term, Term, QFilterCondition> {
  QueryBuilder<Term, Term, QAfterFilterCondition> article(
      FilterQuery<Article> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'article');
    });
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> articleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'article', 0, true, 0, true);
    });
  }
}

extension TermQuerySortBy on QueryBuilder<Term, Term, QSortBy> {
  QueryBuilder<Term, Term, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByLangage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langage', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByLangageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langage', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByPartOfSpeech() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByPartOfSpeechDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortBySimplified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortBySimplifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByStatut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statut', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByStatutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statut', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }
}

extension TermQuerySortThenBy on QueryBuilder<Term, Term, QSortThenBy> {
  QueryBuilder<Term, Term, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByLangage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langage', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByLangageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langage', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByPartOfSpeech() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByPartOfSpeechDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partOfSpeech', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenBySimplified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenBySimplifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByStatut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statut', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByStatutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statut', Sort.desc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }
}

extension TermQueryWhereDistinct on QueryBuilder<Term, Term, QDistinct> {
  QueryBuilder<Term, Term, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByLangage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'langage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByPartOfSpeech(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partOfSpeech', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctBySimplified(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'simplified', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByStatut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statut');
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByVariantTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variantTypes');
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByVariantWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variantWords');
    });
  }

  QueryBuilder<Term, Term, QDistinct> distinctByWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'word', caseSensitive: caseSensitive);
    });
  }
}

extension TermQueryProperty on QueryBuilder<Term, Term, QQueryProperty> {
  QueryBuilder<Term, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Term, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Term, String, QQueryOperations> langageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'langage');
    });
  }

  QueryBuilder<Term, String, QQueryOperations> partOfSpeechProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partOfSpeech');
    });
  }

  QueryBuilder<Term, String, QQueryOperations> simplifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'simplified');
    });
  }

  QueryBuilder<Term, int, QQueryOperations> statutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statut');
    });
  }

  QueryBuilder<Term, List<String>, QQueryOperations> variantTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variantTypes');
    });
  }

  QueryBuilder<Term, List<String>, QQueryOperations> variantWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variantWords');
    });
  }

  QueryBuilder<Term, String, QQueryOperations> wordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'word');
    });
  }
}
