import 'package:untitled/feature/domain/entities/films_entity.dart';

class FilmsModel extends FilmsEntity {
  FilmsModel(
      {required super.title,
        required super.episode_id,
        required super.opening_crawl,
        required super.director,
        required super.producer,
        required super.release_date,});

  factory FilmsModel.fromJson(Map<String, dynamic> json) {
    return FilmsModel(
      title: json['title'] ?? '',
      episode_id: json['episode_id'] ?? '',
      opening_crawl: json['opening_crawl'] ?? '',
      release_date: DateTime.parse(json['release_date'] as String),
      director: json['director'] ?? '',
      producer: json['producer'] ?? '',);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'episode_id': episode_id,
      'opening_crawl': opening_crawl,
      'release_date': release_date?.toIso8601String(),
      'director': director,
      'producer': producer,
    };
  }
}
