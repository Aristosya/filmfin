import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';
import 'package:untitled/feature/presentation/bloc/people_list_cubit/people_list_cubit.dart';
import 'package:untitled/feature/presentation/widgets/people_card_brief.dart';

import '../bloc/people_list_cubit/people_list_state.dart';

class PeopleList extends StatelessWidget {
  PeopleList({Key? key}) : super(key: key);

  final scrollController = ScrollController();
  void settingsScrollController(BuildContext context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels != 0){
          context.read<PeopleListCubit>().loadPeople();
        }
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    settingsScrollController(context);

    return BlocBuilder<PeopleListCubit, PeopleState>(
      builder: (context, state) {
        List<PeopleEntity> people = [];
        bool isLoading = false;
        if (state is PeopleLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PeopleLoading){
          people = state.oldPeopleList;
          isLoading = true;
        }
        else if (state is PeopleLoaded) {
          people = state.peopleList;
        }
        return ListView.separated(
          controller: scrollController,
            itemBuilder: (context,index) {
            if (index < people.length) {return PeopleCardBrief(character: people[index], index: index);}
            else {
              Timer(Duration(milliseconds: 30),(){
                scrollController.jumpTo(scrollController.position.maxScrollExtent);
              });
              return _loadingIndicator();}},
            separatorBuilder: (context, index){return Divider(color: Theme.of(context).dividerColor,thickness: 8,height: 8);},
            itemCount: people.length + (isLoading ? 1 : 0));
      },
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
