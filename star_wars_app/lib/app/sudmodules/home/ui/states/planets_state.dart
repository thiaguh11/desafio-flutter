import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/planet.dart';

@immutable
abstract class PlanetsState extends Equatable {
  const PlanetsState();
}

class Initial extends PlanetsState {
  @override
  List<Object?> get props => [];
}

class Loaded extends PlanetsState {
  final Planet planet;

  const Loaded({required this.planet});

  @override
  List<Object?> get props => [planet];
}
