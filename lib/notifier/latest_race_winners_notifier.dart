import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/repositories/winners_repository.dart';

final latestRaceWinnersNotifierProvider =
    StateNotifierProvider.autoDispose<LatestRaceWinnersNotifier, LatestRaceWinnersState>((ref) {
  return LatestRaceWinnersNotifier(ref.watch(winnersRepositoryProvider))..load();
});

class LatestRaceWinnersNotifier extends StateNotifier<LatestRaceWinnersState> {
  LatestRaceWinnersNotifier(
    this.repository,
  ) : super(const LatestRaceWinnersInitial());

  final WinnersRepository repository;

  Future<void> load() async {
    state = const LatestRaceWinnersLoading();
    try {
      final winners = await repository.getLatestRaceWinners();
      state = LatestRaceWinnersLoaded(winners);
    } catch (e) {
      state = const LatestRaceWinnersFailure();
    }
  }
}
