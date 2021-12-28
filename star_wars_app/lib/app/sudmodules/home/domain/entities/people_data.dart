import 'package:equatable/equatable.dart';

class PeopleData extends Equatable {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final String? created;
  final String? edited;
  final String? url;

  const PeopleData({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films = const [],
    this.species = const [],
    this.vehicles = const [],
    this.starships = const [],
    this.created,
    this.edited,
    this.url,
  });

  @override
  List<Object?> get props {
    return [
      name,
      height,
      mass,
      hairColor,
      skinColor,
      eyeColor,
      birthYear,
      gender,
      homeworld,
      films,
      species,
      vehicles,
      starships,
      created,
      edited,
      url,
    ];
  }

  @override
  bool? get stringify => true;

  PeopleData copyWith({
    String? name,
    String? height,
    String? mass,
    String? hairColor,
    String? skinColor,
    String? eyeColor,
    String? birthYear,
    String? gender,
    String? homeworld,
    List<String>? films,
    List<String>? species,
    List<String>? vehicles,
    List<String>? starships,
    String? created,
    String? edited,
    String? url,
  }) {
    return PeopleData(
      name: name ?? this.name,
      height: height ?? this.height,
      mass: mass ?? this.mass,
      hairColor: hairColor ?? this.hairColor,
      skinColor: skinColor ?? this.skinColor,
      eyeColor: eyeColor ?? this.eyeColor,
      birthYear: birthYear ?? this.birthYear,
      gender: gender ?? this.gender,
      homeworld: homeworld ?? this.homeworld,
      films: films ?? this.films,
      species: species ?? this.species,
      vehicles: vehicles ?? this.vehicles,
      starships: starships ?? this.starships,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      url: url ?? this.url,
    );
  }
}
