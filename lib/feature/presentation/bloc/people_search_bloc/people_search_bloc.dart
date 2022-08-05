import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/presentation/bloc/people_search_bloc/people_search_event.dart';
import 'package:untitled/feature/presentation/bloc/people_search_bloc/people_search_state.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/usecases/search_people.dart';


const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PeopleSearchBloc extends Bloc<PeopleSearchEvent, PeopleSearchState> {
  final SearchPeople searchPeople;

  PeopleSearchBloc({required this.searchPeople}) : super(PeopleSearchEmpty()) {
    on<PeopleSearch>(_onEvent);
  }

  FutureOr<void> _onEvent(
      PeopleSearch event, Emitter<PeopleSearchState> emit) async {
    emit(PeopleSearchLoading());
    final failureOrPerson =
    await searchPeople(SearchPeopleParams(query: event.characterQuery));
    emit(failureOrPerson.fold(
            (failure) => PeopleSearchError(message: _mapFailureToMessage(failure)),
            (people) => PeopleSearchLoaded(people: people)));
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