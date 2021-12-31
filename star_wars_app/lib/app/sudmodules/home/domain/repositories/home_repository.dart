import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';

abstract class IHomeRepository {
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page);
  Future<Either<Exception, Map<String, dynamic>>> getData(String url);
  Future<Either<Exception, bool>> savePeoplesDB(Result<PeopleData> peoples);
  Future<Either<Exception, Result<PeopleData>>> getPeoplesDB();
  Future<Either<Exception, bool>> removePeoplesDB();
}
