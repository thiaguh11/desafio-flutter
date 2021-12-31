import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/app/core/utils/dtos/planet_dto.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/get_data.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  final IGetData getDataUsecase;

  PlanetsCubit(this.getDataUsecase) : super(Initial());

  void fetchPlanet(String url) async {
    final response = await getDataUsecase.getData(url);

    response.fold((error) => debugPrint("error to load planet"), (data) {
      emit(Loaded(planet: PlanetDTO.fromMap(data)));
    });
  }
}
