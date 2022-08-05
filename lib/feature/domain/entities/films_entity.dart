import 'package:equatable/equatable.dart';

class FilmsEntity extends Equatable {
  final String? title;
  final int? episode_id;
  final String? opening_crawl;
  final String? director;
  final String? producer;
  final DateTime? release_date;

  FilmsEntity(
      {required this.title,
        required this.episode_id,
        required this.opening_crawl,
        required this.director,
        required this.producer,
        required this.release_date,});

  @override
  List<Object?> get props => [
    title,
    episode_id,
    opening_crawl,
    director,
    producer,
    release_date,
  ];
}
