import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/main_page_riverpod.dart';
import 'package:golden_tests_with_bloc/notifier/latest_race_winners_notifier.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

class MockLatestRaceWinnersNotifier extends Mock implements LatestRaceWinnersNotifier {
  MockLatestRaceWinnersNotifier() : super();
}

void main() {
  testGoldens(
    'Main Page',
    (tester) async {
      MockLatestRaceWinnersNotifier mock = MockLatestRaceWinnersNotifier();
      when(() => mock.addListener(any())).thenReturn(() {});

      final builder = DeviceBuilder();

      // Loading
      builder.addScenario(
        name: 'Loading',
        widget: Builder(
          builder: (context) {
            when(() => mock.state).thenReturn(const LatestRaceWinnersLoading());
            when(() => mock.addListener(any())).thenReturn(() {});
            when(() => mock.stream).thenAnswer(
              (_) => Stream.fromIterable(
                [
                  const LatestRaceWinnersInitial(),
                  const LatestRaceWinnersLoading(),
                ],
              ),
            );
            return const MainPageRiverpod();
          },
        ),
      );

      // Loaded
      builder.addScenario(
        name: 'Loaded',
        widget: Builder(
          builder: (context) {
            when(() => mock.state).thenReturn(const LatestRaceWinnersLoaded(
              winnersModel,
            ));
            return const MainPageRiverpod();
          },
        ),
      );

      // Failure
      builder.addScenario(
        name: 'Failure',
        widget: Builder(
          builder: (context) {
            when(() => mock.state).thenReturn(
              const LatestRaceWinnersFailure(),
            );

            return const MainPageRiverpod();
          },
        ),
      );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (child) => ProviderScope(
          overrides: [
            latestRaceWinnersNotifierProvider.overrideWithValue(mock),
          ],
          child: materialAppWrapper()(child),
        ),
      );

      await screenMatchesGolden(tester, 'main_page_riverpod');
    },
  );
}
