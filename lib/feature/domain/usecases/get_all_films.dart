import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/feature/domain/repositories/films_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/films_entity.dart';

class GetAllFilms extends UseCase<List<FilmsEntity>,PageFilmsParams>{
  final FilmsRepository filmsRepository;

  GetAllFilms(this.filmsRepository);

  @override
  Future<Either<Failure, List<FilmsEntity>>> call(
      PageFilmsParams params) async {
    return await filmsRepository.getAllFilms(params.page);
  }
}


class PageFilmsParams extends Equatable {
  final int page;

  PageFilmsParams({required this.page});

  @override
  List<Object?> get props => [page];
}