import 'package:flutter/material.dart';
import 'package:untitled/common/styles.dart';

import '../../../generated/l10n.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(BuildContext context)
      : super(searchFieldLabel: S.of(context).search_character);

  final suggestions = [
    'Darth Vader',
    'R2-D2',
    'Chewbacca',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: Icon(Icons.delete_outline))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          return close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      return SizedBox.shrink();
    }
    return ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {query = suggestions[index];},
          child: Ink(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                    suggestions[index],
                    style: ThemeText.infoSmall,
                  ),
            ),
          ),
        ),
        separatorBuilder: (context, index) {
          return Divider(
            height: 4,
            color: Theme.of(context).dividerColor,
          );
        },
        itemCount: suggestions.length);
  }
}
