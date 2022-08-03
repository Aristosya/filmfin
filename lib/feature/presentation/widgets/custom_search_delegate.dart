import 'package:flutter/material.dart';
import 'package:untitled/common/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../domain/entities/people_entity.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../bloc/search_bloc/search_event.dart';
import '../bloc/search_bloc/search_state.dart';
import 'search_result.dart';

class CustomSearchDelegate extends SearchDelegate {
  final context;
  CustomSearchDelegate({required this.context})
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
    print('search delegate query is $query');


    BlocProvider.of<PeopleSearchBloc>(context, listen: false).add(PeopleSearch(query));

    return BlocBuilder<PeopleSearchBloc, PeopleSearchState>(
      builder: (context, state) {
        if (state is PeopleSearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PeopleSearchLoaded) {
          final people = state.people;
          if (people.isEmpty) {
            return _showErrorText('No Characters with that name found');
          }
          return ListView.builder(
            itemCount: people.isNotEmpty ? people.length : 0,
            itemBuilder: (context, int index) {
              PeopleEntity result = people[index];
              return SearchResult(peopleResult: result);
            },
          );
        } else if (state is PeopleSearchError) {
          return _showErrorText(state.message);
        } else {
          return const Center(
            child: Icon(Icons.now_wallpaper),
          );
        }
      },
    );
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
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
