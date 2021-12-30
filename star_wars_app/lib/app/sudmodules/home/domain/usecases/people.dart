import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';

abstract class IPeople {
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page);
  Future<Either<Exception, bool>> savePeoplesDB(Result<PeopleData> peoples);
  Future<Either<Exception, Result<PeopleData>>> getPeoplesDB();
  Future<Either<Exception, bool>> removePeoplesDB();
}

class People implements IPeople {
  final IHomeRepository repository;

  People(this.repository);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page) async =>
      await repository.getPeoples(page);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoplesDB() async =>
      await repository.getPeoplesDB();

  @override
  Future<Either<Exception, bool>> removePeoplesDB() async =>
      await repository.removePeoplesDB();

  @override
  Future<Either<Exception, bool>> savePeoplesDB(
    Result<PeopleData> peoples,
  ) async =>
      repository.savePeoplesDB(peoples);
}
