import 'dart:convert';

import 'package:untitled/core/error/exception.dart';

import 'package:http/http.dart' as http;

import '../models/films_model.dart';

abstract class FilmsRemoteDataSource {
  Future<List<FilmsModel>> getAllFilms(int page);
  Future<List<FilmsModel>> searchFilms(String query);
}

class FilmsRemoteDataSourceImpl implements FilmsRemoteDataSource{
  final http.Client client;


  FilmsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FilmsModel>> getAllFilms(int page) => _getFilmsFromUrl('https://swapi.dev/api/films/?page=$page&format=json');

  @override
  Future<List<FilmsModel>> searchFilms(String query) => _getFilmsFromUrl('https://swapi.dev/api/films/?search=$query');


  Future<List<FilmsModel>> _getFilmsFromUrl(String url) async {
    print(url);
    final response = await client.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode==200) {
      final films = json.decode(response.body);
      var modelFilms = (films['results'] as List).map((film) => FilmsModel.fromJson(film)).toList();
      return modelFilms;
    } else {
      throw ServerException();
    }
  }

}