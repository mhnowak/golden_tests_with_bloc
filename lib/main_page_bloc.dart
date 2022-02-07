import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/repositories/winners_repository.dart';
import 'package:golden_tests_with_bloc/widgets/failure_widget.dart';
import 'package:golden_tests_with_bloc/widgets/loading_widget.dart';
import 'package:golden_tests_with_bloc/widgets/winners_podium_widget.dart';

class MainPageBloc extends StatelessWidget {
  const MainPageBloc({
    Key? key,
    @visibleForTesting this.cubit,
  }) : super(key: key);

  final LatestRaceWinnersCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => (cubit ?? LatestRaceWinnersCubit(RepositoryProvider.of<WinnersRepository>(context)))..load(),
      child: const MainPageBlocContent(),
    );
  }
}

class MainPageBlocContent extends StatelessWidget {
  const MainPageBlocContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latest Race Podium Places',
        ),
      ),
      body: BlocBuilder<LatestRaceWinnersCubit, LatestRaceWinnersState>(
        builder: (context, state) {
          if (state is LatestRaceWinnersLoading) {
            return const LoadingWidget();
          } else if (state is LatestRaceWinnersFailure) {
            return const FailureWidget();
          } else if (state is LatestRaceWinnersLoaded) {
            return WinnersPodiumWidget(
              winnersModel: state.raceWinners,
              onRefresh: () {
                context.read<LatestRaceWinnersCubit>().load();
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
