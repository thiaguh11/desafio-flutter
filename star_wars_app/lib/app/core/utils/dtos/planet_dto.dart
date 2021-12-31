import 'package:star_wars_app/app/sudmodules/home/domain/entities/planet.dart';

abstract class PlanetDTO {
  static Map<String, dynamic> toMap(Planet planet) {
    return {
      'name': planet.name,
      'rotation_period': planet.rotationPeriod,
      'orbital_period': planet.orbitalPeriod,
      'diameter': planet.diameter,
      'climate': planet.climate,
      'gravity': planet.gravity,
      'terrain': planet.terrain,
      'surface_water': planet.surfaceWater,
      'population': planet.population,
      'residents': planet.residents,
      'films': planet.films,
      'created': planet.created,
      'edited': planet.edited,
      'url': planet.url,
    };
  }

  static Planet fromMap(Map<String, dynamic> map) {
    return Planet(
      name: map['name'],
      rotationPeriod: map['rotation_period'],
      orbitalPeriod: map['orbital_period'],
      diameter: map['diameter'],
      climate: map['climate'],
      gravity: map['gravity'],
      terrain: map['terrain'],
      surfaceWater: map['surface_water'],
      population: map['population'],
      residents: List<String>.from(map['residents']),
      films: List<String>.from(map['films']),
      created: map['created'],
      edited: map['edited'],
      url: map['url'],
    );
  }
}
