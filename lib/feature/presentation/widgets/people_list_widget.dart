import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';
import 'package:untitled/feature/presentation/bloc/people_list_cubit/people_list_cubit.dart';

import '../bloc/people_list_cubit/people_list_state.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleListCubit, PeopleState>(
      builder: (context, state) {
        List<PeopleEntity> people = [];
        if (state is PeopleLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PeopleLoaded) {
          people = state.peopleList;
        }
        return ListView.separated(
            itemBuilder: (context,index) {return Text('${people[index]}');},
            separatorBuilder: (context, index){return Divider(color: Theme.of(context).dividerColor,);},
            itemCount: people.length);
      },
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
