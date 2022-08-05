import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/usecases/seacrh_films.dart';
import 'films_search_event.dart';
import 'films_search_state.dart';


const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class FilmsSearchBloc extends Bloc<FilmsSearchEvent, FilmsSearchState> {
  final SearchFilms searchFilms;

  FilmsSearchBloc({required this.searchFilms}) : super(FilmsSearchEmpty()) {
    on<FilmsSearch>(_onEvent);
  }

  FutureOr<void> _onEvent(
      FilmsSearch event, Emitter<FilmsSearchState> emit) async {
    emit(FilmsSearchLoading());
    final failureOrFilms =
    await searchFilms(SearchFilmsParams(query: event.filmsQuery));
    emit(failureOrFilms.fold(
            (failure) => FilmsSearchError(message: _mapFailureToMessage(failure)),
            (films) => FilmsSearchLoaded(films: films)));
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