import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_app/app/core/resources/strings/api_consts.dart';
import 'package:star_wars_app/app/core/utils/dtos/result_dto.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page) async {
    try {
      final response = await dio.get(
        ApiConsts.people,
        queryParameters: {
          'page': page,
        },
      );

      return Right(ResultDTO.resultPeopleDataFromMap(response.data));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
