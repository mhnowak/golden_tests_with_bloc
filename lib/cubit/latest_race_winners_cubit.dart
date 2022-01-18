import 'package:bloc/bloc.dart';
import 'package:golden_tests_with_bloc/model/winners_model.dart';
import 'package:golden_tests_with_bloc/repositories/winners_repository.dart';
import 'package:meta/meta.dart';

part 'latest_race_winners_state.dart';

class LatestRaceWinnersCubit extends Cubit<LatestRaceWinnersState> {
  LatestRaceWinnersCubit(this.repository) : super(const LatestRaceWinnersInitial());

  final WinnersRepository repository;

  Future<void> load() async {
    emit(const LatestRaceWinnersLoading());
    try {
      final winners = await repository.getLatestRaceWinners();
      emit(LatestRaceWinnersLoaded(winners));
    } catch (e) {
      emit(const LatestRaceWinnersFailure());
    }
  }
}
