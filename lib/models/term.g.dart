// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTermCollection on Isar {
  IsarCollection<Term> get terms => getCollection();
}

const TermSchema = CollectionSchema(
  name: 'Term',
  schema:
      '{"name":"Term","idName":"id","properties":[{"name":"hashCode","type":"Long"},{"name":"langage","type":"String"},{"name":"partOfSpeech","type":"String"},{"name":"simplified","type":"String"},{"name":"statut","type":"Long"},{"name":"variantTypes","type":"StringList"},{"name":"variantWords","type":"StringList"},{"name":"word","type":"String"}],"indexes":[],"links":[{"name":"article","target":"Article"}]}',
  idName: 'id',
  propertyIds: {
    'hashCode': 0,
    'langage': 1,
    'partOfSpeech': 2,
    'simplified': 3,
    'statut': 4,
    'variantTypes': 5,
    'variantWords': 6,
    'word': 7
  },
  listProperties: {'variantTypes', 'variantWords'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'article': 0},
  backlinkLinkNames: {},
  getId: _termGetId,
  getLinks: _termGetLinks,
  attachLinks: _termAttachLinks,
  serializeNative: _termSerializeNative,
  deserializeNative: _termDeserializeNative,
  deserializePropNative: _termDeserializePropNative,
  serializeWeb: _termSerializeWeb,
  deserializeWeb: _termDeserializeWeb,
  deserializePropWeb: _termDeserializePropWeb,
  version: 3,
);

int? _termGetId(Term object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _termGetLinks(Term object) {
  return [object.article];
}

void _termSerializeNative(IsarCollection<Term> collection, IsarRawObject rawObj,
    Term object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.hashCode;
  final _hashCode = value0;
  final value1 = object.langage;
  final _langage = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_langage.length) as int;
  final value2 = object.partOfSpeech;
  final _partOfSpeech = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_partOfSpeech.length) as int;
  final value3 = object.simplified;
  final _simplified = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_simplified.length) as int;
  final value4 = object.statut;
  final _statut = value4;
  final value5 = object.variantTypes;
  dynamicSize += (value5.length) * 8;
  final bytesList5 = <IsarUint8List>[];
  for (var str in value5) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList5.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _variantTypes = bytesList5;
  final value6 = object.variantWords;
  dynamicSize += (value6.length) * 8;
  final bytesList6 = <IsarUint8List>[];
  for (var str in value6) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList6.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _variantWords = bytesList6;
  final value7 = object.word;
  final _word = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_word.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _hashCode);
  writer.writeBytes(offsets[1], _langage);
  writer.writeBytes(offsets[2], _partOfSpeech);
  writer.writeBytes(offsets[3], _simplified);
  writer.writeLong(offsets[4], _statut);
  writer.writeStringList(offsets[5], _variantTypes);
  writer.writeStringList(offsets[6], _variantWords);
  writer.writeBytes(offsets[7], _word);
}

Term _termDeserializeNative(IsarCollection<Term> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Term(
    reader.readLong(offsets[4]),
    reader.readString(offsets[7]),
    reader.readStringList(offsets[5]) ?? [],
    reader.readStringList(offsets[6]) ?? [],
    reader.readString(offsets[2]),
    langage: reader.readString(offsets[1]),
  );
  _termAttachLinks(collection, id, object);
  return object;
}

P _termDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
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
      throw 'Illegal propertyIndex';
  }
}

dynamic _termSerializeWeb(IsarCollection<Term> collection, Term object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'langage', object.langage);
  IsarNative.jsObjectSet(jsObj, 'partOfSpeech', object.partOfSpeech);
  IsarNative.jsObjectSet(jsObj, 'simplified', object.simplified);
  IsarNative.jsObjectSet(jsObj, 'statut', object.statut);
  IsarNative.jsObjectSet(jsObj, 'variantTypes', object.variantTypes);
  IsarNative.jsObjectSet(jsObj, 'variantWords', object.variantWords);
  IsarNative.jsObjectSet(jsObj, 'word', object.word);
  return jsObj;
}

Term _termDeserializeWeb(IsarCollection<Term> collection, dynamic jsObj) {
  final object = Term(
    IsarNative.jsObjectGet(jsObj, 'statut') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'word') ?? '',
    (IsarNative.jsObjectGet(jsObj, 'variantTypes') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    (IsarNative.jsObjectGet(jsObj, 'variantWords') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    IsarNative.jsObjectGet(jsObj, 'partOfSpeech') ?? '',
    langage: IsarNative.jsObjectGet(jsObj, 'langage') ?? '',
  );
  _termAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _termDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'langage':
      return (IsarNative.jsObjectGet(jsObj, 'langage') ?? '') as P;
    case 'partOfSpeech':
      return (IsarNative.jsObjectGet(jsObj, 'partOfSpeech') ?? '') as P;
    case 'simplified':
      return (IsarNative.jsObjectGet(jsObj, 'simplified') ?? '') as P;
    case 'statut':
      return (IsarNative.jsObjectGet(jsObj, 'statut') ??
          double.negativeInfinity) as P;
    case 'variantTypes':
      return ((IsarNative.jsObjectGet(jsObj, 'variantTypes') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'variantWords':
      return ((IsarNative.jsObjectGet(jsObj, 'variantWords') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'word':
      return (IsarNative.jsObjectGet(jsObj, 'word') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _termAttachLinks(IsarCollection col, int id, Term object) {
  object.article.attach(col, col.isar.articles, 'article', id);
}

extension TermQueryWhereSort on QueryBuilder<Term, Term, QWhere> {
  QueryBuilder<Term, Term, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TermQueryWhere on QueryBuilder<Term, Term, QWhereClause> {
  QueryBuilder<Term, Term, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Term, Term, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TermQueryFilter on QueryBuilder<Term, Term, QFilterCondition> {
  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'langage',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'langage',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> langageMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'langage',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'partOfSpeech',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'partOfSpeech',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> partOfSpeechMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'partOfSpeech',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'simplified',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'simplified',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> simplifiedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'simplified',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'statut',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'statut',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'statut',
      value: value,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> statutBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'statut',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'variantTypes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'variantTypes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantTypesAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'variantTypes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'variantWords',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'variantWords',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> variantWordsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'variantWords',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'word',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'word',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Term, Term, QAfterFilterCondition> wordMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'word',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TermQueryLinks on QueryBuilder<Term, Term, QFilterCondition> {
  QueryBuilder<Term, Term, QAfterFilterCondition> article(
      FilterQuery<Article> q) {
    return linkInternal(
      isar.articles,
      q,
      'article',
    );
  }
}

extension TermQueryWhereSortBy on QueryBuilder<Term, Term, QSortBy> {
  QueryBuilder<Term, Term, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByLangage() {
    return addSortByInternal('langage', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByLangageDesc() {
    return addSortByInternal('langage', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByPartOfSpeech() {
    return addSortByInternal('partOfSpeech', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByPartOfSpeechDesc() {
    return addSortByInternal('partOfSpeech', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortBySimplified() {
    return addSortByInternal('simplified', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortBySimplifiedDesc() {
    return addSortByInternal('simplified', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByStatut() {
    return addSortByInternal('statut', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByStatutDesc() {
    return addSortByInternal('statut', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByWord() {
    return addSortByInternal('word', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> sortByWordDesc() {
    return addSortByInternal('word', Sort.desc);
  }
}

extension TermQueryWhereSortThenBy on QueryBuilder<Term, Term, QSortThenBy> {
  QueryBuilder<Term, Term, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByLangage() {
    return addSortByInternal('langage', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByLangageDesc() {
    return addSortByInternal('langage', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByPartOfSpeech() {
    return addSortByInternal('partOfSpeech', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByPartOfSpeechDesc() {
    return addSortByInternal('partOfSpeech', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenBySimplified() {
    return addSortByInternal('simplified', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenBySimplifiedDesc() {
    return addSortByInternal('simplified', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByStatut() {
    return addSortByInternal('statut', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByStatutDesc() {
    return addSortByInternal('statut', Sort.desc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByWord() {
    return addSortByInternal('word', Sort.asc);
  }

  QueryBuilder<Term, Term, QAfterSortBy> thenByWordDesc() {
    return addSortByInternal('word', Sort.desc);
  }
}

extension TermQueryWhereDistinct on QueryBuilder<Term, Term, QDistinct> {
  QueryBuilder<Term, Term, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Term, Term, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Term, Term, QDistinct> distinctByLangage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('langage', caseSensitive: caseSensitive);
  }

  QueryBuilder<Term, Term, QDistinct> distinctByPartOfSpeech(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('partOfSpeech', caseSensitive: caseSensitive);
  }

  QueryBuilder<Term, Term, QDistinct> distinctBySimplified(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('simplified', caseSensitive: caseSensitive);
  }

  QueryBuilder<Term, Term, QDistinct> distinctByStatut() {
    return addDistinctByInternal('statut');
  }

  QueryBuilder<Term, Term, QDistinct> distinctByWord(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('word', caseSensitive: caseSensitive);
  }
}

extension TermQueryProperty on QueryBuilder<Term, Term, QQueryProperty> {
  QueryBuilder<Term, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Term, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Term, String, QQueryOperations> langageProperty() {
    return addPropertyNameInternal('langage');
  }

  QueryBuilder<Term, String, QQueryOperations> partOfSpeechProperty() {
    return addPropertyNameInternal('partOfSpeech');
  }

  QueryBuilder<Term, String, QQueryOperations> simplifiedProperty() {
    return addPropertyNameInternal('simplified');
  }

  QueryBuilder<Term, int, QQueryOperations> statutProperty() {
    return addPropertyNameInternal('statut');
  }

  QueryBuilder<Term, List<String>, QQueryOperations> variantTypesProperty() {
    return addPropertyNameInternal('variantTypes');
  }

  QueryBuilder<Term, List<String>, QQueryOperations> variantWordsProperty() {
    return addPropertyNameInternal('variantWords');
  }

  QueryBuilder<Term, String, QQueryOperations> wordProperty() {
    return addPropertyNameInternal('word');
  }
}
