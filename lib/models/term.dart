import 'package:france_termes/tool/extension.dart';
import 'package:isar/isar.dart';
import 'package:collection/collection.dart';
import 'article.dart';
part 'term.g.dart';

@Collection()
class Term {
  static final RegExp regExpFeminin = RegExp(r', -[a-zA-Z]+');
  static final RegExp regExpPartOfSpeech = RegExp(r', (([a-zA-Z])+\.)+');
  // Metadata :
  Id id = Isar.autoIncrement;

  @Backlink(to: 'terms')
  final IsarLink<Article> article = IsarLink<Article>();
  // Informations :
  final int statut;
  late final String partOfSpeech;
  final String langage;
  // Data :
  late final String word;
  // variants
  final List<String> variantTypes; // "type of variante"
  final List<String> variantWords; // "variante"
  static String parsePartOfSpeech(String word) {
    return regExpPartOfSpeech.firstMatch(word)?[0] ?? "";
  }

  static String deletePartOfSpeech(String word) {
    return word.replaceAll(regExpPartOfSpeech, "");
  }

  Term(this.statut, this.word, this.variantTypes, this.variantWords,
      this.partOfSpeech,
      {this.langage = "fr"});

  String get simplified => simplify();

  String simplify() {
    final String simplified = word.replaceAll(regExpFeminin, "");
    return simplified.removeDiacritics();
  }

  String toStrVariants() {
    StringBuffer buffer = StringBuffer();
    for (final pair in IterableZip([variantTypes, variantWords])) {
      buffer.write("${pair[0]} : ${pair[1]} ");
    }
    return buffer.toString();
  }

  @override
  String toString() {
    return '$word $partOfSpeech ($langage) ou ${toStrVariants()}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Term &&
          runtimeType == other.runtimeType &&
          statut == other.statut &&
          partOfSpeech == other.partOfSpeech &&
          word == other.word &&
          langage == other.langage;
  @override
  int get hashCode =>
      statut.hashCode ^
      partOfSpeech.hashCode ^
      word.hashCode ^
      langage.hashCode;

  List<String> variantsStartWith(String query) {
    List<String> words = [];
    for (final variant in variantWords) {
      String simplifiedVariant = variant.removeDiacritics();
      if (simplifiedVariant.startsWithUnsensitive(query)) {
        words.add(variant);
      }
    }
    return words;
  }

  List<String> wordsStartWith(String query) {
    List<String> words = [];
    if (word.startsWithUnsensitive(query)) {
      words.add(word);
    }
    words.addAll(variantsStartWith(query));
    return words;
  }
}
