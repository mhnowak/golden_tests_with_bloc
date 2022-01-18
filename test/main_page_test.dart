import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/main_page.dart';
import 'package:golden_tests_with_bloc/model/winners_model.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

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

            return MainPage(cubit: mock);
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
                  LatestRaceWinnersLoaded(
                    WinnersModel(
                      firstPlace: Driver(
                        firstName: 'Max',
                        familyName: 'Verstappen',
                      ),
                      secondPlace: Driver(
                        firstName: 'Lewis',
                        familyName: 'Hamilton',
                      ),
                      thirdPlace: Driver(
                        firstName: 'Carlos',
                        familyName: 'Sainz',
                      ),
                    ),
                  ),
                ],
              ),
              initialState: const LatestRaceWinnersInitial(),
            );
            return MainPage(cubit: mock);
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

            return MainPage(cubit: mock);
          },
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'main_page');
    },
  );
}
