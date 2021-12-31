import 'package:equatable/equatable.dart';

class Specie extends Equatable {
  final String? name;
  final String? classification;
  final String? designation;
  final String? averageHeight;
  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;
  final String? averageLifespan;
  final String? homeworld;
  final String? language;
  final List<String> people;
  final List<String> films;
  final String? created;
  final String? edited;
  final String? url;

  const Specie({
    this.name,
    this.classification,
    this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.homeworld,
    this.language,
    this.people = const [],
    this.films = const [],
    this.created,
    this.edited,
    this.url,
  });

  @override
  List<Object?> get props {
    return [
      name,
      classification,
      designation,
      averageHeight,
      skinColors,
      hairColors,
      eyeColors,
      averageLifespan,
      homeworld,
      language,
      people,
      films,
      created,
      edited,
      url,
    ];
  }
}
