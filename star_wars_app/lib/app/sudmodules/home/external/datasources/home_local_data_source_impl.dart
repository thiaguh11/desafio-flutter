import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:star_wars_app/app/core/resources/strings/hive_strings.dart';
import 'package:star_wars_app/app/core/utils/dtos/result_dto.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_local_data_source.dart';

class HomeLocalDataSourceImpl implements IHomeLocalDataSource {
  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoplesDB() async {
    try {
      var peoplesDB = Hive.box(HiveStrings.peoples).values.toList();
      var parsedToObject =
          ResultDTO.resultPeopleDataFromMap<PeopleData>(peoplesDB.first);
      return Right(parsedToObject);
    } on Exception catch (_) {
      rethrow;
    } on StateError catch (_) {
      throw Exception("No peoples!");
    }
  }

  @override
  Future<Either<Exception, bool>> removePeoplesDB() async {
    Hive.box(HiveStrings.peoples).delete("0");
    return const Right(true);
  }

  @override
  Future<Either<Exception, bool>> savePeoplesDB(
    Result<PeopleData> peoples,
  ) async {
    Hive.box(HiveStrings.peoples).put(
      "0",
      ResultDTO.toMap(peoples),
    );
    return const Right(true);
  }
}
