import 'package:dartz/dartz.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';

abstract class IPeople {
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page);
}

class People implements IPeople {
  final IHomeRepository repository;

  People(this.repository);

  @override
  Future<Either<Exception, Result<PeopleData>>> getPeoples(int page) async =>
      await repository.getPeoples(page);
}
