import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';

@immutable
abstract class PeoplesState extends Equatable {
  const PeoplesState();
}

class Initial extends PeoplesState {
  @override
  List<Object?> get props => [];
}

class Loading extends PeoplesState {
  @override
  List<Object?> get props => [];
}

class Error extends PeoplesState {
  @override
  List<Object?> get props => [];
}

class Loaded extends PeoplesState {
  final List<PeopleData> peoples;
  final bool hasMoreResults;

  const Loaded({
    this.peoples = const [],
    this.hasMoreResults = true,
  });

  @override
  List<Object?> get props => [peoples, hasMoreResults];

  Loaded copyWith({
    List<PeopleData>? peoples,
    bool? hasMoreResults,
  }) {
    return Loaded(
      peoples: peoples ?? this.peoples,
      hasMoreResults: hasMoreResults ?? this.hasMoreResults,
    );
  }
}
