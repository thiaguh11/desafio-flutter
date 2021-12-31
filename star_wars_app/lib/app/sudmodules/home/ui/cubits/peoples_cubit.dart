import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/people_data.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/entities/result.dart';
import 'package:star_wars_app/app/sudmodules/home/domain/usecases/people.dart';
import 'package:star_wars_app/app/sudmodules/home/ui/states/peoples_state.dart';

class PeoplesCubit extends Cubit<PeoplesState> {
  final IPeople peopleUsecase;
  int currentPage = 1;

  PeoplesCubit(this.peopleUsecase) : super(Initial());

  void fetchPeoples() async {
    if (state is Initial) {
      emit(Loading());

      var peoplesDBResponse = await peopleUsecase.getPeoplesDB();

      await peoplesDBResponse.fold(
        (error) async {
          debugPrint("error DB");
          final response = await peopleUsecase.getPeoples(currentPage++);
          response.fold(
            (error) => emit(Error()),
            (result) {
              saveData(result);
              emit(
                Loaded(
                  peoples: result.results,
                  hasMoreResults: result.next?.isNotEmpty ?? false,
                ),
              );
            },
          );
        },
        (result) async {
          var nextPage = Uri.dataFromString(
                result.next ?? "",
              ).queryParameters['page'] ??
              "";

          debugPrint(nextPage);

          if (nextPage.isNotEmpty) currentPage = int.parse(nextPage);

          emit(
            Loaded(
              peoples: result.results,
              hasMoreResults: result.next?.isNotEmpty ?? false,
            ),
          );
          return;
        },
      );
    }
  }

  void fetchMore() async {
    var previousPeoples = <PeopleData>[];

    if (state is Loaded && (state as Loaded).hasMoreResults) {
      previousPeoples += (state as Loaded).peoples;

      final response = await peopleUsecase.getPeoples(currentPage++);
      response.fold(
        (error) => emit(Error()),
        (result) {
          saveData(
            result.copyWith(results: previousPeoples + result.results),
          );
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

  saveData(Result<PeopleData> result) async {
    await peopleUsecase.removePeoplesDB();
    await peopleUsecase.savePeoplesDB(result);
  }
}
