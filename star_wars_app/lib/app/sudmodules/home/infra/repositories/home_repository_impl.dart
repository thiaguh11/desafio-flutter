import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_local_data_source.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDataSource remoteDataSource;
  final IHomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page) async {
    try {
      return await remoteDataSource.getPeoples(page);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoplesDB() async {
    try {
      return await localDataSource.getPeoplesDB();
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> removePeoplesDB() async {
    try {
      return await localDataSource.removePeoplesDB();
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> savePeoplesDB(
    Result<PeopleData> peoples,
  ) async {
    try {
      return await localDataSource.savePeoplesDB(peoples);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> getData(
    String url,
  ) async {
    try {
      return await remoteDataSource.getData(url);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
