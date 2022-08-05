import 'package:dartz/dartz.dart';
import 'package:untitled/core/error/failure.dart';
import 'package:untitled/core/platform/network_info.dart';
import 'package:untitled/feature/data/models/films_model.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';
import 'package:untitled/feature/domain/repositories/films_repository.dart';

import '../../../core/error/exception.dart';
import '../datasources/films_local_data_source.dart';
import '../datasources/films_remote_data_source.dart';

class FilmsRepositoryImpl implements FilmsRepository{
  final FilmsRemoteDataSource remoteDataSource;
  final FilmsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FilmsRepositoryImpl({required this.remoteDataSource, required this.localDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<FilmsEntity>>> getAllFilms(int page) async {
    return await _getFilms((){
      return remoteDataSource.getAllFilms(page);
    });
  }

  @override
  Future<Either<Failure, List<FilmsEntity>>> searchFilms(String query) async {
    return await _getFilms((){
      return remoteDataSource.searchFilms(query);
    });
  }


  Future<Either<Failure, List<FilmsModel>>> _getFilms (Future<List<FilmsModel>> Function() getFilms) async{
    if (await networkInfo.isConnected){
      try {
        final remotefilms = await getFilms();
        localDataSource.filmsToCash(remotefilms);
        return Right(remotefilms);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    else{
      try {
        final localFilms = await localDataSource.getLastFilmsFromCash();
        return Right(localFilms);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}
