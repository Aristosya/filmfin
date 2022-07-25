import 'package:equatable/equatable.dart';

class PeopleEntity extends Equatable {
  final String? name;
  final int? height;
  final int? mass;
  final String? hair_color;
  final String? skin_color;
  final String? eye_color;
  final String? birth_year;
  final String? gender;
  final String? homeworld_url;
  final List<String>? films;
  final List<String>? vehicles;
  final List<String>? starships;
  final DateTime? created;
  final String? url;

  PeopleEntity(
      {required this.name,
      required this.height,
      required this.mass,
      required this.hair_color,
      required this.skin_color,
      required this.eye_color,
      required this.birth_year,
      required this.gender,
      required this.homeworld_url,
      required this.films,
      required this.vehicles,
      required this.starships,
      required this.created,
      required this.url});

  @override
  List<Object?> get props => [name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld_url,films,vehicles,starships,created,url];
}
