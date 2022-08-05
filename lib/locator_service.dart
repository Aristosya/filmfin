import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/platform/network_info.dart';
import 'package:untitled/feature/data/datasources/people_local_data_source.dart';
import 'package:untitled/feature/data/datasources/people_remote_data_source.dart';
import 'package:untitled/feature/data/repositories/people_repository_impl.dart';
import 'package:untitled/feature/domain/repositories/films_repository.dart';
import 'package:untitled/feature/domain/repositories/people_repository.dart';
import 'package:untitled/feature/domain/usecases/get_all_films.dart';
import 'package:untitled/feature/domain/usecases/get_all_people.dart';
import 'package:untitled/feature/domain/usecases/search_people.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/feature/presentation/bloc/people_search_bloc/people_search_bloc.dart';
import 'feature/data/datasources/films_local_data_source.dart';
import 'feature/data/datasources/films_remote_data_source.dart';
import 'feature/data/repositories/films_repository_impl.dart';
import 'feature/domain/usecases/seacrh_films.dart';
import 'feature/presentation/bloc/films_list_cubit/films_list_cubit.dart';
import 'feature/presentation/bloc/films_search_bloc/films_search_bloc.dart';
import 'feature/presentation/bloc/people_list_cubit/people_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // bloc
  //    people
  sl.registerFactory(() => PeopleListCubit(getAllPeople: sl()));
  sl.registerFactory(() =>PeopleSearchBloc(searchPeople: sl()));
  //    films
  sl.registerFactory(() => FilmsListCubit(getAllFilms: sl()));
  sl.registerFactory(() =>FilmsSearchBloc(searchFilms: sl()));

  //usecases
  //    people
  sl.registerLazySingleton(() => GetAllPeople(sl()));
  sl.registerLazySingleton(() => SearchPeople(sl()));
  //    films
  sl.registerLazySingleton(() => GetAllFilms(sl()));
  sl.registerLazySingleton(() => SearchFilms(sl()));
  //repositories
  //    people
  sl.registerLazySingleton<PeopleRepository>(() => PeopleRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<PeopleRemoteDataSource>(() => PeopleRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PeopleLocalDataSource>(() => PeopleLocalDataSourceImpl(sharedPreferences: sl()));
  //    films
  sl.registerLazySingleton<FilmsRepository>(() => FilmsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FilmsRemoteDataSource>(() => FilmsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<FilmsLocalDataSource>(() => FilmsLocalDataSourceImpl(sharedPreferences: sl()));

  // Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //external resources
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
