import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/people.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final IPeople peopleUsecase;
  int currentPage = 1;

  HomePageCubit(this.peopleUsecase) : super(Initial());

  void fetchPeoples() async {
    var previousPeoples = <PeopleData>[];

    if (state is Loaded) {
      if (!(state as Loaded).hasMoreResults) return;
      previousPeoples += (state as Loaded).peoples;
    }

    if (state is Initial) emit(Loading());

    final response = await peopleUsecase.getPeoples(currentPage++);

    response.fold(
      (error) => emit(Error()),
      (result) {
        emit(
          Loaded(
            peoples: previousPeoples + result.results,
            hasMoreResults: result.next?.isNotEmpty ?? false,
          ),
        );
      },
    );
  }
}
