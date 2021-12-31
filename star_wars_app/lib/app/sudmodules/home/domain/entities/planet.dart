import 'package:equatable/equatable.dart';

class Planet extends Equatable {
  final String? name;
  final String? rotationPeriod;
  final String? orbitalPeriod;
  final String? diameter;
  final String? climate;
  final String? gravity;
  final String? terrain;
  final String? surfaceWater;
  final String? population;
  final List<String> residents;
  final List<String> films;
  final String? created;
  final String? edited;
  final String? url;

  const Planet({
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents = const [],
    this.films = const [],
    this.created,
    this.edited,
    this.url,
  });

  @override
  List<Object?> get props {
    return [
      name,
      rotationPeriod,
      orbitalPeriod,
      diameter,
      climate,
      gravity,
      terrain,
      surfaceWater,
      population,
      residents,
      films,
      created,
      edited,
      url,
    ];
  }

  @override
  bool? get stringify => true;
}
