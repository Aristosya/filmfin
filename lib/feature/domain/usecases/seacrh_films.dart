import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';
import 'package:untitled/feature/domain/repositories/films_repository.dart';
import '../../../core/error/failure.dart';

class SearchFilms extends UseCase<List<FilmsEntity>,SearchFilmsParams> {
  final FilmsRepository filmsRepository;

  SearchFilms(this.filmsRepository);

  Future<Either<Failure,List<FilmsEntity>>>call(SearchFilmsParams params) async {
    return await filmsRepository.searchFilms(params.query);
  }
}

class SearchFilmsParams extends Equatable {
  final String query;

  SearchFilmsParams({required this.query});

  @override
  List<Object?> get props => [query];

}