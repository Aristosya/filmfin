import 'package:equatable/equatable.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';

abstract class FilmsSearchState extends Equatable {
  const FilmsSearchState();

  @override
  List<Object> get props => [];
}

class FilmsSearchEmpty extends FilmsSearchState {}

class FilmsSearchLoading extends FilmsSearchState {}

class FilmsSearchLoaded extends FilmsSearchState {
  final List<FilmsEntity> films;

  const FilmsSearchLoaded({required this.films});

  @override
  List<Object> get props => [films];
}

class FilmsSearchError extends FilmsSearchState {
  final String message;

  const FilmsSearchError({required this.message});

  @override
  List<Object> get props => [message];}