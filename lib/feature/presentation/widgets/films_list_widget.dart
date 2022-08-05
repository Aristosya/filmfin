import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/films_entity.dart';
import '../bloc/films_list_cubit/films_list_cubit.dart';
import '../bloc/films_list_cubit/films_list_state.dart';
import 'films_card_brief.dart';


class FilmsList extends StatelessWidget {
  FilmsList({Key? key}) : super(key: key);

  final scrollController = ScrollController();
  void settingsScrollController(BuildContext context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels != 0){
          context.read<FilmsListCubit>().loadFilms();
        }
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    settingsScrollController(context);

    return BlocBuilder<FilmsListCubit, FilmsState>(
      builder: (context, state) {
        List<FilmsEntity> films = [];
        bool isLoading = false;
        if (state is FilmsLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is FilmsLoading){
          films = state.oldFilmsList;
          isLoading = true;
        }
        else if (state is FilmsLoaded) {
          films = state.filmsList;
        }
        return ListView.separated(
            controller: scrollController,
            itemBuilder: (context,index) {
              if (index < films.length) {return FilmsCardBrief(film: films[index], index: index);}
              else {
                Timer(Duration(milliseconds: 30),(){
                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                });
                return _loadingIndicator();}},
            separatorBuilder: (context, index){return Divider(color: Theme.of(context).dividerColor,thickness: 8,height: 8);},
            itemCount: films.length + (isLoading ? 1 : 0));
      },
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
