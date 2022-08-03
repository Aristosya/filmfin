import 'package:equatable/equatable.dart';
import '../../../domain/entities/people_entity.dart';

abstract class PeopleSearchState extends Equatable {
  const PeopleSearchState();

  @override
  List<Object> get props => [];
}

class PeopleSearchEmpty extends PeopleSearchState {}

class PeopleSearchLoading extends PeopleSearchState {}

class PeopleSearchLoaded extends PeopleSearchState {
  final List<PeopleEntity> people;

  const PeopleSearchLoaded({required this.people});

  @override
  List<Object> get props => [people];
}

class PeopleSearchError extends PeopleSearchState {
  final String message;

  const PeopleSearchError({required this.message});

  @override
  List<Object> get props => [message];}