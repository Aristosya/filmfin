import 'package:dartz/dartz.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';

import '../../../core/error/failure.dart';

abstract class PeopleRepository {
  Future<Either<Failure,List<PeopleEntity>>> getAllPeople(int page);
  Future<Either<Failure,List<PeopleEntity>>> searchPeople(String query);
}