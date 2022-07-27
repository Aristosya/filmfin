import 'dart:convert';

import 'package:untitled/core/error/exception.dart';

import '../models/people_model.dart';
import 'package:http/http.dart' as http;

abstract class PeopleRemoteDataSource {
  Future<List<PeopleModel>> getAllPeople(int page);
  Future<List<PeopleModel>> searchPeople(String query);
}

class PeopleRemoteDataSourceImpl implements PeopleRemoteDataSource{
  final http.Client client;


  PeopleRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PeopleModel>> getAllPeople(int page) => _getPersonFromUrl('https://swapi.dev/api/people/?page=$page');

  @override
  Future<List<PeopleModel>> searchPeople(String query) => _getPersonFromUrl('https://swapi.dev/api/people/?search=$query');


  Future<List<PeopleModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode==200) {
      final people = json.decode(response.body);
      return (people as List).map((character) => PeopleModel.fromJson(character)).toList();
    } else {
      throw ServerException();
    }
  }

}