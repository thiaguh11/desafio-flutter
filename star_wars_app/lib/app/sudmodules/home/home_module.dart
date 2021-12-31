import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/resources/strings/api_consts.dart';
import 'package:star_wars_app/app/core/resources/strings/app_routes.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/repositories/home_repository.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/get_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/people.dart';
import 'package:star_wars_app/app/sudmodules/home/external/datasources/home_local_data_source_impl.dart';
import 'package:star_wars_app/app/sudmodules/home/external/datasources/home_remote_data_source_impl.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_local_data_source.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/datasources/home_remote_data_source.dart';
import 'package:star_wars_app/app/sudmodules/home/infra/repositories/home_repository_impl.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/planets_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/species_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/pages/home_page.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/pages/people_details_page.dart';

import 'ui/cubits/peoples_cubit.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind<Dio>((i) => Dio(BaseOptions(baseUrl: ApiConsts.swapiBaseUrl))),
        Bind<IHomeRemoteDataSource>((i) => HomeRemoteDataSourceImpl(i())),
        Bind<IHomeLocalDataSource>((i) => HomeLocalDataSourceImpl()),
        Bind<IHomeRepository>((i) => HomeRepositoryImpl(i(), i())),
        Bind<IPeople>((i) => People(i())),
        Bind<IGetData>((i) => GetData(i())),
        Bind<PeoplesCubit>((i) => PeoplesCubit(i())),
        Bind<PlanetsCubit>((i) => PlanetsCubit(i()), isSingleton: false),
        Bind<SpeciesCubit>((i) => SpeciesCubit(i()), isSingleton: false),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, _) => const HomePage(),
        ),
        ChildRoute(
          AppRoutes.peopleDetails,
          child: (_, args) => PeopleDetailsPage(peopleData: args.data),
        ),
      ];
}
