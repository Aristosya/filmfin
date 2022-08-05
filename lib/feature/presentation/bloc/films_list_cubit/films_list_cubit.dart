import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';
import 'package:untitled/feature/presentation/bloc/films_list_cubit/films_list_state.dart';
import 'package:untitled/feature/presentation/bloc/people_list_cubit/people_list_state.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/entities/people_entity.dart';
import '../../../domain/usecases/get_all_films.dart';
import '../../../domain/usecases/get_all_people.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class FilmsListCubit extends Cubit<FilmsState> {
  final GetAllFilms getAllFilms;

  FilmsListCubit({required this.getAllFilms}) : super(FilmsEmpty());

  int page = 1;

  void loadFilms() async {
    if (state is FilmsLoading) return;

    final currentState = state;

    var oldFilms = <FilmsEntity>[];
    if (currentState is FilmsLoaded) {
      if (page < 1){
        oldFilms = currentState.filmsList;
      }
    }

    emit(FilmsLoading(oldFilms, isFirstFetch: page == 1));

    final failureOrFilms = await getAllFilms(PageFilmsParams(page: page));

    failureOrFilms.fold(
            (error) => emit(FilmsError(message: _mapFailureToMessage(error))),
            (film) {
          if (page<1){page++;}
          final films = (state as FilmsLoading).oldFilmsList;
          films.addAll(film);
          // print('List length: ${people.length.toString()}');
          emit(FilmsLoaded(films));
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