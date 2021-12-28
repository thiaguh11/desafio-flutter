import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';

abstract class PeopleDataDTO {
  static PeopleData fromMap(Map<String, dynamic> map) {
    return PeopleData(
      name: map['name'],
      height: map['height'],
      mass: map['mass'],
      hairColor: map['hair_color'],
      skinColor: map['skin_color'],
      eyeColor: map['eye_color'],
      birthYear: map['birth_year'],
      gender: map['gender'],
      homeworld: map['homeworld'],
      films: List<String>.from(map['films']),
      species: List<String>.from(map['species']),
      vehicles: List<String>.from(map['vehicles']),
      starships: List<String>.from(map['starships']),
      created: map['created'],
      edited: map['edited'],
      url: map['url'],
    );
  }

  static Map<String, dynamic> toMap(PeopleData peopleData) {
    return {
      'name': peopleData.name,
      'height': peopleData.height,
      'mass': peopleData.mass,
      'hairColor': peopleData.hairColor,
      'skinColor': peopleData.skinColor,
      'eyeColor': peopleData.eyeColor,
      'birthYear': peopleData.birthYear,
      'gender': peopleData.gender,
      'homeworld': peopleData.homeworld,
      'films': peopleData.films,
      'species': peopleData.species,
      'vehicles': peopleData.vehicles,
      'starships': peopleData.starships,
      'created': peopleData.created,
      'edited': peopleData.edited,
      'url': peopleData.url,
    };
  }
}
