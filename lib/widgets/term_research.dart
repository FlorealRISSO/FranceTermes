import 'package:flutter/material.dart';
import 'package:france_termes/providers/data_provider.dart';
import 'package:france_termes/tool/extension.dart';

import '../models/article.dart';
import '../models/domain.dart';
import '../models/term.dart';
import 'article_preview/article_preview.dart';
import 'article_preview/article_result_preview.dart';

class TermResearch extends SearchDelegate {
  DataProvider provider;
  late List<Domain> domains;
  TermResearch(this.provider);
  Widget? _widgetSuggestions;
  @override
  String get searchFieldLabel => "...";

  /* => Ajout domain...
  void onChange(setState, Domain? domain) => setState(() => _selected = domain);

  Widget _buildAnnexe(context, setState) {
    List<Widget> widgets = [
      ListTile(
          title: const Text('Aucun'),
          leading: Radio<Domain>(
              value: _empty,
              groupValue: _selected,
              onChanged: (Domain? value) => setState(() => _selected = value)))
    ];
    for (final domain in domains) {
      widgets.add(ListTile(
          title: Text(domain.field),
          leading: Radio<Domain>(
              value: domain,
              groupValue: _selected,
              onChanged: (Domain? value) =>
                  setState(() => _selected = value))));
    }
    return SimpleDialog(
        title: const Padding(
            padding: EdgeInsets.only(bottom: 8), child: Text('Domaines: ')),
        children: widgets);
  }

  StatefulBuilder buildRadio() {
    return StatefulBuilder(
        builder: (context, setState) => _buildAnnexe(context, setState));
  }
  */

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
    final String simplifiedQuery = query.removeDiacritics();
    return FutureBuilder(
        future: provider.searchArticles(simplifiedQuery),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData as List<Article>;
            _widgetSuggestions = ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleResultPreview(
                    article: articles[index],
                    provider: provider,
                    query: simplifiedQuery);
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
    final String simplifiedQuery = query.removeDiacritics();

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
