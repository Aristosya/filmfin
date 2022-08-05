import 'package:equatable/equatable.dart';

abstract class PeopleSearchEvent extends Equatable {
  const PeopleSearchEvent();

  @override
  List<Object> get props => [];
}

class PeopleSearch extends PeopleSearchEvent {
  final String characterQuery;

  const PeopleSearch(this.characterQuery);


}