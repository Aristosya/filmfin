import 'package:equatable/equatable.dart';

abstract class FilmsSearchEvent extends Equatable {
  const FilmsSearchEvent();

  @override
  List<Object> get props => [];
}

class FilmsSearch extends FilmsSearchEvent {
  final String filmsQuery;

  const FilmsSearch(this.filmsQuery);
}