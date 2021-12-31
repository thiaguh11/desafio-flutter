import 'package:star_wars_app/app/sudmodules/home/domain/entities/specie.dart';

abstract class SpecieDTO {
  static Map<String, dynamic> toMap(Specie specie) {
    return {
      'name': specie.name,
      'classification': specie.classification,
      'designation': specie.designation,
      'averageHeight': specie.averageHeight,
      'skinColors': specie.skinColors,
      'hairColors': specie.hairColors,
      'eyeColors': specie.eyeColors,
      'averageLifespan': specie.averageLifespan,
      'homeworld': specie.homeworld,
      'language': specie.language,
      'people': specie.people,
      'films': specie.films,
      'created': specie.created,
      'edited': specie.edited,
      'url': specie.url,
    };
  }

  static Specie fromMap(Map<String, dynamic> map) {
    return Specie(
      name: map['name'],
      classification: map['classification'],
      designation: map['designation'],
      averageHeight: map['averageHeight'],
      skinColors: map['skinColors'],
      hairColors: map['hairColors'],
      eyeColors: map['eyeColors'],
      averageLifespan: map['averageLifespan'],
      homeworld: map['homeworld'],
      language: map['language'],
      people: List<String>.from(map['people']),
      films: List<String>.from(map['films']),
      created: map['created'],
      edited: map['edited'],
      url: map['url'],
    );
  }
}
