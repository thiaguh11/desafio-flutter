import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SpeciesState extends Equatable {
  const SpeciesState();
}

class Initial extends SpeciesState {
  @override
  List<Object?> get props => [];
}

class Loaded extends SpeciesState {
  final String species;

  const Loaded({required this.species});

  @override
  List<Object?> get props => [species];
}