import 'package:star_wars_app/app/core/utils/dtos/people_data_dto.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';

abstract class ResultDTO {
  static Map<dynamic, dynamic> toMap(Result result) {
    return {
      'count': result.count,
      'next': result.next,
      'previous': result.previous,
      'results': result.results.map((x) => PeopleDataDTO.toMap(x)).toList(),
    };
  }

  static Result<PeopleData> resultPeopleDataFromMap<PeopleData>(
      Map<dynamic, dynamic> map) {
    return Result<PeopleData>(
      count: map['count']?.toInt(),
      next: map['next'],
      previous: map['previous'],
      results: List<PeopleData>.from(
        map['results']?.map((x) => PeopleDataDTO.fromMap(x)),
      ),
    );
  }
}
