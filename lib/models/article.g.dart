// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetArticleCollection on Isar {
  IsarCollection<Article> get articles => getCollection();
}

const ArticleSchema = CollectionSchema(
  name: 'Article',
  schema:
      '{"name":"Article","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"definition","type":"String"},{"name":"domains","type":"StringList"},{"name":"getUrl","type":"String"},{"name":"notes","type":"String"},{"name":"numero","type":"String"},{"name":"source","type":"String"},{"name":"toQuestion","type":"String"},{"name":"toSeeId","type":"LongList"},{"name":"warning","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'date': 0,
    'definition': 1,
    'domains': 2,
    'getUrl': 3,
    'notes': 4,
    'numero': 5,
    'source': 6,
    'toQuestion': 7,
    'toSeeId': 8,
    'warning': 9
  },
  listProperties: {'domains', 'toSeeId'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'terms': 0},
  backlinkLinkNames: {'terms': 'article'},
  getId: _articleGetId,
  getLinks: _articleGetLinks,
  attachLinks: _articleAttachLinks,
  serializeNative: _articleSerializeNative,
  deserializeNative: _articleDeserializeNative,
  deserializePropNative: _articleDeserializePropNative,
  serializeWeb: _articleSerializeWeb,
  deserializeWeb: _articleDeserializeWeb,
  deserializePropWeb: _articleDeserializePropWeb,
  version: 3,
);

int? _articleGetId(Article object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _articleGetLinks(Article object) {
  return [object.terms];
}

void _articleSerializeNative(
    IsarCollection<Article> collection,
    IsarRawObject rawObj,
    Article object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final value1 = object.definition;
  final _definition = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_definition.length) as int;
  final value2 = object.domains;
  dynamicSize += (value2.length) * 8;
  final bytesList2 = <IsarUint8List>[];
  for (var str in value2) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList2.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _domains = bytesList2;
  final value3 = object.getUrl;
  final _getUrl = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_getUrl.length) as int;
  final value4 = object.notes;
  final _notes = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_notes.length) as int;
  final value5 = object.numero;
  final _numero = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_numero.length) as int;
  final value6 = object.source;
  final _source = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_source.length) as int;
  final value7 = object.toQuestion;
  final _toQuestion = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_toQuestion.length) as int;
  final value8 = object.toSeeId;
  dynamicSize += (value8.length) * 8;
  final _toSeeId = value8;
  final value9 = object.warning;
  final _warning = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_warning.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
  writer.writeBytes(offsets[1], _definition);
  writer.writeStringList(offsets[2], _domains);
  writer.writeBytes(offsets[3], _getUrl);
  writer.writeBytes(offsets[4], _notes);
  writer.writeBytes(offsets[5], _numero);
  writer.writeBytes(offsets[6], _source);
  writer.writeBytes(offsets[7], _toQuestion);
  writer.writeLongList(offsets[8], _toSeeId);
  writer.writeBytes(offsets[9], _warning);
}

Article _articleDeserializeNative(IsarCollection<Article> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Article(
    id,
    reader.readString(offsets[5]),
    reader.readDateTime(offsets[0]),
    reader.readString(offsets[1]),
    reader.readStringList(offsets[2]) ?? [],
    reader.readLongList(offsets[8]) ?? [],
    reader.readString(offsets[4]),
    reader.readString(offsets[6]),
    reader.readString(offsets[9]),
    reader.readString(offsets[7]),
  );
  _articleAttachLinks(collection, id, object);
  return object;
}

P _articleDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _articleSerializeWeb(
    IsarCollection<Article> collection, Article object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'definition', object.definition);
  IsarNative.jsObjectSet(jsObj, 'domains', object.domains);
  IsarNative.jsObjectSet(jsObj, 'getUrl', object.getUrl);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'notes', object.notes);
  IsarNative.jsObjectSet(jsObj, 'numero', object.numero);
  IsarNative.jsObjectSet(jsObj, 'source', object.source);
  IsarNative.jsObjectSet(jsObj, 'toQuestion', object.toQuestion);
  IsarNative.jsObjectSet(jsObj, 'toSeeId', object.toSeeId);
  IsarNative.jsObjectSet(jsObj, 'warning', object.warning);
  return jsObj;
}

Article _articleDeserializeWeb(
    IsarCollection<Article> collection, dynamic jsObj) {
  final object = Article(
    IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'numero') ?? '',
    IsarNative.jsObjectGet(jsObj, 'date') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'date'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    IsarNative.jsObjectGet(jsObj, 'definition') ?? '',
    (IsarNative.jsObjectGet(jsObj, 'domains') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    (IsarNative.jsObjectGet(jsObj, 'toSeeId') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>() ??
        [],
    IsarNative.jsObjectGet(jsObj, 'notes') ?? '',
    IsarNative.jsObjectGet(jsObj, 'source') ?? '',
    IsarNative.jsObjectGet(jsObj, 'warning') ?? '',
    IsarNative.jsObjectGet(jsObj, 'toQuestion') ?? '',
  );
  _articleAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _articleDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'date':
      return (IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'definition':
      return (IsarNative.jsObjectGet(jsObj, 'definition') ?? '') as P;
    case 'domains':
      return ((IsarNative.jsObjectGet(jsObj, 'domains') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'getUrl':
      return (IsarNative.jsObjectGet(jsObj, 'getUrl') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'notes':
      return (IsarNative.jsObjectGet(jsObj, 'notes') ?? '') as P;
    case 'numero':
      return (IsarNative.jsObjectGet(jsObj, 'numero') ?? '') as P;
    case 'source':
      return (IsarNative.jsObjectGet(jsObj, 'source') ?? '') as P;
    case 'toQuestion':
      return (IsarNative.jsObjectGet(jsObj, 'toQuestion') ?? '') as P;
    case 'toSeeId':
      return ((IsarNative.jsObjectGet(jsObj, 'toSeeId') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>() ??
          []) as P;
    case 'warning':
      return (IsarNative.jsObjectGet(jsObj, 'warning') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _articleAttachLinks(IsarCollection col, int id, Article object) {
  object.terms.attach(col, col.isar.terms, 'terms', id);
}

extension ArticleQueryWhereSort on QueryBuilder<Article, Article, QWhere> {
  QueryBuilder<Article, Article, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ArticleQueryWhere on QueryBuilder<Article, Article, QWhereClause> {
  QueryBuilder<Article, Article, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Article, Article, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idBetween(
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

extension ArticleQueryFilter
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'definition',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'definition',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> definitionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'definition',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'domains',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'domains',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> domainsAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'domains',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'getUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'getUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> getUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'getUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Article, Article, QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'notes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'notes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'numero',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'numero',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> numeroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'numero',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'source',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'source',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'source',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'toQuestion',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'toQuestion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toQuestionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'toQuestion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdAnyEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'toSeeId',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdAnyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'toSeeId',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdAnyLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'toSeeId',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> toSeeIdAnyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'toSeeId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'warning',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'warning',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> warningMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'warning',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ArticleQueryLinks
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> terms(
      FilterQuery<Term> q) {
    return linkInternal(
      isar.terms,
      q,
      'terms',
    );
  }
}

extension ArticleQueryWhereSortBy on QueryBuilder<Article, Article, QSortBy> {
  QueryBuilder<Article, Article, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDefinition() {
    return addSortByInternal('definition', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByDefinitionDesc() {
    return addSortByInternal('definition', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByGetUrl() {
    return addSortByInternal('getUrl', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByGetUrlDesc() {
    return addSortByInternal('getUrl', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNumero() {
    return addSortByInternal('numero', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByNumeroDesc() {
    return addSortByInternal('numero', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortBySource() {
    return addSortByInternal('source', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortBySourceDesc() {
    return addSortByInternal('source', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByToQuestion() {
    return addSortByInternal('toQuestion', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByToQuestionDesc() {
    return addSortByInternal('toQuestion', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByWarning() {
    return addSortByInternal('warning', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByWarningDesc() {
    return addSortByInternal('warning', Sort.desc);
  }
}

extension ArticleQueryWhereSortThenBy
    on QueryBuilder<Article, Article, QSortThenBy> {
  QueryBuilder<Article, Article, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDefinition() {
    return addSortByInternal('definition', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByDefinitionDesc() {
    return addSortByInternal('definition', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByGetUrl() {
    return addSortByInternal('getUrl', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByGetUrlDesc() {
    return addSortByInternal('getUrl', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNumero() {
    return addSortByInternal('numero', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByNumeroDesc() {
    return addSortByInternal('numero', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenBySource() {
    return addSortByInternal('source', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenBySourceDesc() {
    return addSortByInternal('source', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByToQuestion() {
    return addSortByInternal('toQuestion', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByToQuestionDesc() {
    return addSortByInternal('toQuestion', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByWarning() {
    return addSortByInternal('warning', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByWarningDesc() {
    return addSortByInternal('warning', Sort.desc);
  }
}

extension ArticleQueryWhereDistinct
    on QueryBuilder<Article, Article, QDistinct> {
  QueryBuilder<Article, Article, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<Article, Article, QDistinct> distinctByDefinition(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('definition', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByGetUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('getUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Article, Article, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('notes', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByNumero(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('numero', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('source', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByToQuestion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('toQuestion', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByWarning(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('warning', caseSensitive: caseSensitive);
  }
}

extension ArticleQueryProperty
    on QueryBuilder<Article, Article, QQueryProperty> {
  QueryBuilder<Article, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<Article, String, QQueryOperations> definitionProperty() {
    return addPropertyNameInternal('definition');
  }

  QueryBuilder<Article, List<String>, QQueryOperations> domainsProperty() {
    return addPropertyNameInternal('domains');
  }

  QueryBuilder<Article, String, QQueryOperations> getUrlProperty() {
    return addPropertyNameInternal('getUrl');
  }

  QueryBuilder<Article, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Article, String, QQueryOperations> notesProperty() {
    return addPropertyNameInternal('notes');
  }

  QueryBuilder<Article, String, QQueryOperations> numeroProperty() {
    return addPropertyNameInternal('numero');
  }

  QueryBuilder<Article, String, QQueryOperations> sourceProperty() {
    return addPropertyNameInternal('source');
  }

  QueryBuilder<Article, String, QQueryOperations> toQuestionProperty() {
    return addPropertyNameInternal('toQuestion');
  }

  QueryBuilder<Article, List<int>, QQueryOperations> toSeeIdProperty() {
    return addPropertyNameInternal('toSeeId');
  }

  QueryBuilder<Article, String, QQueryOperations> warningProperty() {
    return addPropertyNameInternal('warning');
  }
}
