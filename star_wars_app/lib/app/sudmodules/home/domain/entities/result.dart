import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<T> results;

  const Result({
    this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  @override
  List<Object?> get props => [count, next, previous, results];

  @override
  bool? get stringify => true;

  Result copyWith({
    int? count,
    String? next,
    String? previous,
    List<T>? results,
  }) {
    return Result(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
