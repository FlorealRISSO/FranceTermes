import 'package:france_termes/models/term.dart';
import "package:isar/isar.dart";

import 'domain.dart';
part 'article.g.dart';

/// The `Article` class represents an article in the [xml file](https://www.data.gouv.fr/fr/datasets/base-franceterme-termes-scientifiques-et-techniques-1/) used to store the data.
@Collection()
class Article {
  static const baseUrl = "http://www.culture.fr/franceterme/terme/";

  // Metadata :
  Id id; // Needed
  final String numero; // Needed
  final DateTime date;
  final List<int> toSeeId;
  final String notes;
  final String source;
  final String warning;
  final String toQuestion;
  // Terms :
  final IsarLinks<Term> terms = IsarLinks();
  // Domains :
  final IsarLinks<Domain> domains = IsarLinks();

  /// Informations :
  /// Even index -> hash of the domain it refers to
  /// Odd index -> index of the sub-domain into the domain class
  final List<int> subDomainsIndex;

  // Definition :
  final String definition;
  String get getUrl => baseUrl + numero;

  Article(
      this.id,
      this.numero,
      this.date,
      this.definition,
      this.toSeeId,
      this.subDomainsIndex,
      this.notes,
      this.source,
      this.warning,
      this.toQuestion);

  @override
  String toString() {
    return 'Article{id: $id, numero: $numero, date: $date, metadata: $notes, definition: $definition, url : $baseUrl$numero}';
  }

  String toRead() {
    return '''Article $numero - $id
    terms : $terms
    domains : $domains
    ''';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Article && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id;
}
