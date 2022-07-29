import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/core/usecases/usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/people_entity.dart';
import '../repositories/people_repository.dart';

class GetAllPeople extends UseCase<List<PeopleEntity>,PagePeopleParams>{
  final PeopleRepository peopleRepository;

  GetAllPeople(this.peopleRepository);

  @override
  Future<Either<Failure, List<PeopleEntity>>> call(
      PagePeopleParams params) async {
    return await peopleRepository.getAllPeople(params.page);
  }
}


class PagePeopleParams extends Equatable {
  final int page;

  PagePeopleParams({required this.page});

  @override
  List<Object?> get props => [page];
}