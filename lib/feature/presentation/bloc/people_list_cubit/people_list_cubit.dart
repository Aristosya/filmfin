import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/presentation/bloc/people_list_cubit/people_list_state.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/entities/people_entity.dart';
import '../../../domain/usecases/get_all_people.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PeopleListCubit extends Cubit<PeopleState> {
  final GetAllPeople getAllPeople;

  PeopleListCubit({required this.getAllPeople}) : super(PeopleEmpty());

  int page = 1;

  void loadPeople() async {
    if (state is PeopleLoading) return;

    final currentState = state;

    var oldPerson = <PeopleEntity>[];
    if (currentState is PeopleLoaded) {
      oldPerson = currentState.peopleList;
    }

    emit(PeopleLoading(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPeople(PagePeopleParams(page: page));

    failureOrPerson.fold(
            (error) => emit(PeopleError(message: _mapFailureToMessage(error))),
            (character) {
          page++;
          final people = (state as PeopleLoading).oldPeopleList;
          people.addAll(character);
          // print('List length: ${people.length.toString()}');
          emit(PeopleLoaded(people));
        });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}