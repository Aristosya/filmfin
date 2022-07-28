import 'package:dartz/dartz.dart';
import 'package:untitled/core/error/failure.dart';
import 'package:untitled/core/platform/network_info.dart';
import 'package:untitled/feature/data/datasources/people_local_data_source.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';
import 'package:untitled/feature/domain/repositories/people_repository.dart';

import '../../../core/error/exception.dart';
import '../datasources/people_remote_data_source.dart';
import '../models/people_model.dart';

class PeopleRepositoryImpl implements PeopleRepository{
  final PeopleRemoteDataSource remoteDataSource;
  final PeopleLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PeopleRepositoryImpl({required this.remoteDataSource, required this.localDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<PeopleEntity>>> getAllPeople(int page) async {
    return await _getPeople((){
      return remoteDataSource.getAllPeople(page);
    });
  }

  @override
  Future<Either<Failure, List<PeopleEntity>>> searchPeople(String query) async {
    return await _getPeople((){
      return remoteDataSource.searchPeople(query);
    });
  }


  Future<Either<Failure, List<PeopleModel>>> _getPeople (Future<List<PeopleModel>> Function() getPeople) async{
    if (await networkInfo.isConnected){
      try {
        final remotePeople = await getPeople();
        localDataSource.peopleToCash(remotePeople);
        return Right(remotePeople);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    else{
      try {
        final localPeople = await localDataSource.getLastPeopleFromCash();
        return Right(localPeople);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
  
}