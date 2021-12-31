import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/app/core/widgets/default_scaffold.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/planets_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/cubits/species_cubit.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/planets_state.dart'
    as planetState;
import 'package:star_wars_app/app/sudmodules/home/ui/states/species_state.dart'
    as speciesState;
import 'package:star_wars_app/app/sudmodules/home/ui/widgets/info_widget.dart';

class PeopleDetailsPage extends StatefulWidget {
  final PeopleData peopleData;

  const PeopleDetailsPage({
    Key? key,
    required this.peopleData,
  }) : super(key: key);

  @override
  State<PeopleDetailsPage> createState() => _PeopleDetailsPageState();
}

class _PeopleDetailsPageState extends State<PeopleDetailsPage> {
  final PlanetsCubit planetsCubit = Modular.get<PlanetsCubit>();
  final SpeciesCubit speciesCubit = Modular.get<SpeciesCubit>();

  @override
  void initState() {
    super.initState();
    if (widget.peopleData.homeworld?.isNotEmpty ?? false) {
      planetsCubit.fetchPlanet(widget.peopleData.homeworld!);
    }
    if (widget.peopleData.species.isNotEmpty) {
      widget.peopleData.species.add("https://swapi.dev/api/species/35/");
      speciesCubit.fetchSpecies(widget.peopleData.species);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        title: Text(
          widget.peopleData.name ?? "Details",
        ),
      ),
      body: (ctx, constraints) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoWidget(
                label: "Name",
                value: widget.peopleData.name,
              ),
              InfoWidget(
                label: "Height",
                value: widget.peopleData.height,
              ),
              InfoWidget(
                label: "Mass",
                value: widget.peopleData.mass,
              ),
              InfoWidget(
                label: "Hair Color",
                value: widget.peopleData.hairColor,
              ),
              InfoWidget(
                label: "Skin Color",
                value: widget.peopleData.skinColor,
              ),
              InfoWidget(
                label: "Eye Color",
                value: widget.peopleData.eyeColor,
              ),
              InfoWidget(
                label: "Birth Year",
                value: widget.peopleData.birthYear,
              ),
              InfoWidget(
                label: "Gender",
                value: widget.peopleData.gender,
              ),
              BlocBuilder(
                bloc: planetsCubit,
                builder: (_, state) {
                  if (state is planetState.Loaded) {
                    return InfoWidget(
                      label: "Planet Name",
                      value: state.planet.name,
                    );
                  }
                  return Container();
                },
              ),
              BlocBuilder(
                bloc: speciesCubit,
                builder: (_, state) {
                  if (state is speciesState.Loaded) {
                    return InfoWidget(
                      label: "Species",
                      value: state.species,
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
