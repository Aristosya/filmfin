import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/error/exception.dart';
import 'package:untitled/feature/data/models/people_model.dart';

abstract class PeopleLocalDataSource {
  Future<List<PeopleModel>> getLastPeopleFromCash();
  Future<void> peopleToCash(List<PeopleModel> people);
}


const CASHED_PEOPLE_LIST = 'CASHED_PEOPLE_LIST';


class PeopleLocalDataSourceImpl implements PeopleLocalDataSource {
  final SharedPreferences sharedPreferences;

  PeopleLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PeopleModel>> getLastPeopleFromCash() {
    final jsonPeopleList = sharedPreferences.getStringList(CASHED_PEOPLE_LIST);
    if (jsonPeopleList!.isNotEmpty)
      {
      return Future.value(jsonPeopleList.map((character) => PeopleModel.fromJson(json.decode(character))).toList());
      }
    else {
      throw CacheException();
    }
  }

  @override
  Future<void> peopleToCash(List<PeopleModel> people) {
    final List<String> jsonPeopleList = people.map((character) => json.encode(character.toJson())).toList();

    sharedPreferences.setStringList(CASHED_PEOPLE_LIST, jsonPeopleList);
    return Future.value(jsonPeopleList);
  }
  
}