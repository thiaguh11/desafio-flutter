import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/resources/strings/api_consts.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/people.dart';
import 'package:star_wars_app/app/sudmodules/home/external/datasources/home_remote_data_source_impl.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_remote_data_source.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/repositories/home_repository_impl.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/pages/home_page.dart';

import 'ui/cubits/home_page_cubit.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<Dio>((i) => Dio(BaseOptions(baseUrl: ApiConsts.swapiBaseUrl))),
        Bind<IHomeRemoteDataSource>((i) => HomeRemoteDataSourceImpl(i())),
        Bind<IHomeRepository>((i) => HomeRepositoryImpl(i())),
        Bind<IPeople>((i) => People(i())),
        Bind<HomePageCubit>((i) => HomePageCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, _) => const HomePage(),
        ),
      ];
}
