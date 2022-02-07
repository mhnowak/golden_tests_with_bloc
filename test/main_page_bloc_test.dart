import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/main_page_bloc.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

class MockLatestRaceWinnersCubit extends MockCubit<LatestRaceWinnersState> implements LatestRaceWinnersCubit {}

void main() {
  testGoldens(
    'Main Page',
    (tester) async {
      MockLatestRaceWinnersCubit mock = MockLatestRaceWinnersCubit();
      when(() => mock.load()).thenAnswer((_) async {});

      final builder = DeviceBuilder();

      // Loading
      builder.addScenario(
        name: 'Loading',
        widget: Builder(
          builder: (context) {
            whenListen(
              mock,
              Stream.fromIterable(
                const [
                  LatestRaceWinnersInitial(),
                  LatestRaceWinnersLoading(),
                ],
              ),
              initialState: const LatestRaceWinnersInitial(),
            );

            return MainPageBloc(cubit: mock);
          },
        ),
      );

      // Loaded
      builder.addScenario(
        name: 'Loaded',
        widget: Builder(
          builder: (context) {
            whenListen(
              mock,
              Stream.fromIterable(
                const [
                  LatestRaceWinnersInitial(),
                  LatestRaceWinnersLoading(),
                  LatestRaceWinnersLoaded(winnersModel),
                ],
              ),
              initialState: const LatestRaceWinnersInitial(),
            );
            return MainPageBloc(cubit: mock);
          },
        ),
      );

      // Failure
      builder.addScenario(
        name: 'Failure',
        widget: Builder(
          builder: (context) {
            whenListen(
              mock,
              Stream.fromIterable(
                const [
                  LatestRaceWinnersInitial(),
                  LatestRaceWinnersLoading(),
                  LatestRaceWinnersFailure(),
                ],
              ),
              initialState: const LatestRaceWinnersInitial(),
            );
            return MainPageBloc(cubit: mock);
          },
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'main_page_bloc');
    },
  );
}
