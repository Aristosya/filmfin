import 'package:equatable/equatable.dart';

import '../../../domain/entities/people_entity.dart';

abstract class PeopleState extends Equatable {
  const PeopleState();

  @override
  List<Object> get props => [];
}
class PeopleEmpty extends PeopleState {
  @override
  List<Object> get props => [];
}

class PeopleLoading extends PeopleState {
  final List<PeopleEntity> oldPeopleList;
  final bool isFirstFetch;

  const PeopleLoading(this.oldPeopleList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPeopleList];
}

class PeopleLoaded extends PeopleState {
  final List<PeopleEntity> peopleList;

  const PeopleLoaded(this.peopleList);

  @override
  List<Object> get props => [peopleList];
}

class PeopleError extends PeopleState {
  final String message;

  const PeopleError({required this.message});

  @override
  List<Object> get props => [message];
}