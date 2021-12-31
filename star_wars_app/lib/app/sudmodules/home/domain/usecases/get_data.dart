import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';

abstract class IGetData {
  Future<Either<Exception, Map<String, dynamic>>> getData(String url);
}

class GetData implements IGetData {
  final IHomeRepository repository;

  GetData(this.repository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> getData(String url) async =>
      await repository.getData(url);
}
