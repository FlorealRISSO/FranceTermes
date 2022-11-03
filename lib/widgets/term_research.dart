import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/tool/extension.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

import '../models/article.dart';
import '../models/term.dart';
import '../tool/mutable_pointer.dart';
import 'article_preview/article_result_preview.dart';
import 'field_drop_button.dart';

class TermResearch extends SearchDelegate {
  static const String all = "Tous";
  DataProvider provider;

  TermResearch(this.provider);

  Widget? _widgetResults;
  String? _lastQuery;
  String? _lastField;

  final MutablePointer<String> _selectedValue = MutablePointer(all);
  @override
  String get searchFieldLabel => "...";

  bool hasChanged() {
    return query != _lastQuery || _selectedValue.pointer != _lastField;
  }

  //Ajout domain...
  // -------------------
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
      FieldDropButtun(
        selectedValue: _selectedValue,
        fields: provider.getDomains(),
        unSelected: all,
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
    if (!hasChanged()) {
      return _widgetResults!;
    }
    final String simplifiedQuery = query.toUpperAscii();
    final String? fieldUsed =
        _selectedValue.pointer == all ? null : _selectedValue.pointer;
    final Future<List<Article>> Function() searchArticleMethod =
        _selectedValue.pointer == all
            ? () => provider.searchArticles(simplifiedQuery)
            : () => provider.searchArticlesWithFields(
                simplifiedQuery, _selectedValue.pointer);
    return FutureBuilder(
        future: searchArticleMethod(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData as List<Article>;
            _widgetResults = ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleResultPreview(
                    article: articles[index],
                    provider: provider,
                    query: simplifiedQuery,
                    field: fieldUsed);
              },
            );
            _lastQuery = query;
            _lastField = _selectedValue.pointer;
            return _widgetResults!;
          } else if (snapshot.hasError) {
            return const Text("Error...");
          } else {
            return //_widgetSuggestions ??
                Center(
              child: ThemeConstants.coloredCircularProgressIndicator(context),
            );
          }
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final String simplifiedQuery = query.toUpperAscii();
    final Future<List<Term>> searchWordsMethod = _selectedValue.pointer == all
        ? provider.searchWords(simplifiedQuery)
        : provider.searchWordsWithFields(
            simplifiedQuery, _selectedValue.pointer);
    return FutureBuilder(
        future: searchWordsMethod,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Term> terms = snapshot.requireData as List<Term>;
            Set<String> allTerms = {};
            for (final term in terms) {
              allTerms.addAll(term.wordsStartWith(simplifiedQuery));
            }
            Widget widgetSuggestions = ListView.builder(
              itemCount: allTerms.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(allTerms.elementAt(index)),
                  onTap: () {
                    query = allTerms.elementAt(index);
                    showResults(context);
                  },
                );
              },
            );
            return widgetSuggestions;
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error..."));
          } else {
            return Center(
                child:
                    ThemeConstants.coloredCircularProgressIndicator(context));
          }
        }));
  }
}
