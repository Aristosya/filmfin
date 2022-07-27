import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/core/usecases/usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/people_entity.dart';
import '../repositories/people_repository.dart';

class SearchPeople extends UseCase <List<PeopleEntity>, SearchPeopleParams>{
  final PeopleRepository peopleRepository;

  SearchPeople(this.peopleRepository);

  Future<Either<Failure,List<PeopleEntity>>> call(SearchPeopleParams params) async {
    return await peopleRepository.searchPeople(params.query);
  }
}

class SearchPeopleParams extends Equatable {
  final String query;

  SearchPeopleParams({required this.query});

  @override
  List<Object?> get props => [query];

}