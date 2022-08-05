import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/error/exception.dart';
import 'package:untitled/feature/data/models/films_model.dart';

abstract class FilmsLocalDataSource {
  Future<List<FilmsModel>> getLastFilmsFromCash();
  Future<void> filmsToCash(List<FilmsModel> films);
}


const CASHED_PEOPLE_LIST = 'CASHED_PEOPLE_LIST';


class FilmsLocalDataSourceImpl implements FilmsLocalDataSource {
  final SharedPreferences sharedPreferences;

  FilmsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<FilmsModel>> getLastFilmsFromCash() {
    final jsonFilmsList = sharedPreferences.getStringList(CASHED_PEOPLE_LIST);
    if (jsonFilmsList!.isNotEmpty)
    {
      return Future.value(jsonFilmsList.map((film) => FilmsModel.fromJson(json.decode(film))).toList());
    }
    else {
      throw CacheException();
    }
  }

  @override
  Future<void> filmsToCash(List<FilmsModel> films) {
    final List<String> jsonFilmList = films.map((film) => json.encode(film.toJson())).toList();

    sharedPreferences.setStringList(CASHED_PEOPLE_LIST, jsonFilmList);
    return Future.value(jsonFilmList);
  }

}