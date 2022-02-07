import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/notifier/latest_race_winners_notifier.dart';
import 'package:golden_tests_with_bloc/widgets/failure_widget.dart';
import 'package:golden_tests_with_bloc/widgets/loading_widget.dart';
import 'package:golden_tests_with_bloc/widgets/winners_podium_widget.dart';

class MainPageRiverpod extends StatelessWidget {
  const MainPageRiverpod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latest Race Podium Places',
        ),
      ),
      body: const MainPageRiverpodContent(),
    );
  }
}

class MainPageRiverpodContent extends ConsumerWidget {
  const MainPageRiverpodContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(latestRaceWinnersNotifierProvider);

    if (state is LatestRaceWinnersLoading) {
      return const LoadingWidget();
    } else if (state is LatestRaceWinnersFailure) {
      return const FailureWidget();
    } else if (state is LatestRaceWinnersLoaded) {
      return WinnersPodiumWidget(
        winnersModel: state.raceWinners,
        onRefresh: () {
          ref.read(latestRaceWinnersNotifierProvider.notifier).load();
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
