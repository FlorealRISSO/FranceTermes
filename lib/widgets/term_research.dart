import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:diacritic/diacritic.dart' as diacritic;
import '../models/article.dart';
import '../models/term.dart';
import 'article_preview/article_preview.dart';

class TermResearch extends SearchDelegate {
  DataProvider provider;
  TermResearch(this.provider);
  Widget? _widgetSuggestions;

  @override
  String get searchFieldLabel => "...";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final String simplifiedQuery = diacritic.removeDiacritics(query);
    return FutureBuilder(
        future: provider.searchArticles(simplifiedQuery),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData as List<Article>;
            _widgetSuggestions = ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticlePreview(articles[index], provider);
              },
            );
            return _widgetSuggestions!;
          } else if (snapshot.hasError) {
            return const Text("Error...");
          } else {
            return _widgetSuggestions ?? const CircularProgressIndicator();
          }
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final String simplifiedQuery = diacritic.removeDiacritics(query);

    return FutureBuilder(
        future: provider.searchWords(simplifiedQuery),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Term> terms = snapshot.requireData as List<Term>;
            _widgetSuggestions = ListView.builder(
              itemCount: terms.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(terms[index].word),
                  onTap: () {
                    query = terms[index].word;
                    showResults(context);
                  },
                );
              },
            );
            return _widgetSuggestions!;
          } else if (snapshot.hasError) {
            return const Text("Error...");
          } else {
            return _widgetSuggestions ?? const CircularProgressIndicator();
          }
        }));
  }
}
