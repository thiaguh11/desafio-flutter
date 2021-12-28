import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';

abstract class IHomeRepository {
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page);
}