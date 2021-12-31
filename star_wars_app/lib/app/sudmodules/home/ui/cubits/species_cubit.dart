import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/app/core/utils/dtos/specie_dto.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/get_data.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/species_state.dart';

class SpeciesCubit extends Cubit<SpeciesState> {
  final IGetData getDataUsecase;

  SpeciesCubit(this.getDataUsecase) : super(Initial());

  void fetchSpecies(List<String> species) async {
    final List<String> listSpecies = [];

    for (var specie in species) {
      final response = await getDataUsecase.getData(specie);

      response.fold(
        (error) => debugPrint("error to load species"),
        (data) {
          listSpecies.add(SpecieDTO.fromMap(data).name ?? "");
        },
      );
    }

    emit(Loaded(species: listSpecies.join(",")));
  }
}
