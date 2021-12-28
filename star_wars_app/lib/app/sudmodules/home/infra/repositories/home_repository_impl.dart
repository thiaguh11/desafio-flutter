import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page) async {
    try {
      return await remoteDataSource.getPeoples(page);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
