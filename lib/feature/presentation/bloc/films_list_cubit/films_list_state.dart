import 'package:equatable/equatable.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';

import '../../../domain/entities/people_entity.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}
class FilmsEmpty extends FilmsState {
  @override
  List<Object> get props => [];
}

class FilmsLoading extends FilmsState {
  final List<FilmsEntity> oldFilmsList;
  final bool isFirstFetch;

  const FilmsLoading(this.oldFilmsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldFilmsList];
}

class FilmsLoaded extends FilmsState {
  final List<FilmsEntity> filmsList;

  const FilmsLoaded(this.filmsList);

  @override
  List<Object> get props => [filmsList];
}

class FilmsError extends FilmsState {
  final String message;

  const FilmsError({required this.message});

  @override
  List<Object> get props => [message];
}