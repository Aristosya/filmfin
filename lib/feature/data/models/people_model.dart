import 'dart:math';

import 'package:untitled/feature/domain/entities/people_entity.dart';

class PeopleModel extends PeopleEntity {
  PeopleModel(
      {required super.name,
      required super.height,
      required super.mass,
      required super.hair_color,
      required super.skin_color,
      required super.eye_color,
      required super.birth_year,
      required super.gender,
      required super.homeworld_url,
      required super.films,
      required super.vehicles,
      required super.starships,
      required super.created,
      required super.url});

  // PeopleModel({required name,
  //   required height,
  //   required mass,
  //   required hair_color,
  //   required skin_color,
  //   required eye_color,
  //   required birth_year,
  //   required gender,
  //   required homeworld_url,
  //   required films,
  //   required vehicles,
  //   required starships,
  //   required created,
  //   required url
  //
  // }) : super(
  //     name: name;
  //     height: height;
  //     mass: mass;
  //     hair_color:hair_color;
  //     skin_color:skin_color;
  //     eye_color:eye_color;
  //     birth_year:birth_year;
  //     gender:gender;
  //     homeworld_url:homeworld_url;
  //     films:films;
  //     starships:starships;
  //     created: created;
  //     url: url;
  // );

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      skin_color: json['skin_color'] ?? '',
      vehicles:
          (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] ?? '',
      hair_color: json['hair_color'] ?? '',
      eye_color: json['eye_color'] ?? '',
      birth_year: json['birth_year'] ?? '',
      homeworld_url: json['homeworld_url'] ?? '',
      mass: json['mass'] != null ? json['mass'] as int : null,
      height: json['height'] != null ? json['height'] as int : null,
    );
  }


  Map<String,dynamic> toJson() {
    return{
    'name': name,
        'height': height,
        'mass': mass,
        'hair_color':hair_color,
        'skin_color':skin_color,
        'eye_color':eye_color,
        'birth_year':birth_year,
        'gender':gender,
        'homeworld_url':homeworld_url,
        'films':films,
        'starships':starships,
        'created': created?.toIso8601String(),
        'url': url,
    };
  }
}
