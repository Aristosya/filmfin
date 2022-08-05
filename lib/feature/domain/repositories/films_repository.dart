import 'package:dartz/dartz.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';
import '../../../core/error/failure.dart';

abstract class FilmsRepository {
  Future<Either<Failure,List<FilmsEntity>>> getAllFilms(int page);
  Future<Either<Failure,List<FilmsEntity>>> searchFilms(String query);
}