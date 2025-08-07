// CustomSearchDelegate provides the search UI and logic.
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final String initialQuery; // Define a field to hold the passed value

  CustomSearchDelegate(this.initialQuery) {
    query = initialQuery;
  }

  // The list of all possible search terms.
  final List<String> searchTerms = [
    'Taladros',
    'Humedad',
    'Cascos',
    'botas de seguridad',
    'tornillos',
    'Martillos',
    'Destornilladores',
    'Cinta métrica',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          // If the query is empty, close the search view. Otherwise, clear the query.
          if (query.isEmpty) {
            close(context, initialQuery);
          } else {
            query = '';
            showSuggestions(context); // Show all suggestions again
          }
        },
      ),
    ];
  }

  // This method is called when the user presses the leading icon (usually a back button).
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // Close the search view and return null.
        close(context, initialQuery);
      },
    );
  }

  // This method is called when the user submits the search query (e.g., by pressing enter).
  @override
  Widget buildResults(BuildContext context) {
    // Filter the search terms based on the query.
    final List<String> matchQuery = searchTerms
        .where((term) => term.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Build a list view of the search results.
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final String result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            // When a result is tapped, close the search view and return the result.
            close(context, result.toLowerCase());
          },
        );
      },
    );
  }

  // This method is called to build the suggestions that are displayed below the search bar.
  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the search terms based on the current query.
    final List<String> suggestionList = query.isEmpty
        ? searchTerms // Show all terms if the query is empty
        : searchTerms
              .where((term) => term.toLowerCase().contains(query.toLowerCase()))
              .toList();

    // Build a list view of the suggestions.
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final String suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
