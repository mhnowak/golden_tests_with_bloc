import 'package:flutter_test/flutter_test.dart';
import 'package:golden_tests_with_bloc/cubit/latest_race_winners_cubit.dart';
import 'package:golden_tests_with_bloc/notifier/latest_race_winners_notifier.dart';
import 'package:golden_tests_with_bloc/repositories/winners_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_data.dart';

class MockWinnersRepository extends Mock implements WinnersRepository {}

void main() {
  late MockWinnersRepository mock;
  late LatestRaceWinnersNotifier notifier;

  setUp(() {
    mock = MockWinnersRepository();
    notifier = LatestRaceWinnersNotifier(mock);
  });

  test('Should emit [loading, loaded] after succesfull repository answer', () async {
    when(() => mock.getLatestRaceWinners()).thenAnswer((_) async => winnersModel);

    expectLater(
      notifier.stream,
      emitsInOrder([
        isA<LatestRaceWinnersLoading>(),
        isA<LatestRaceWinnersLoaded>(),
      ]),
    );

    await notifier.load();
  });

  test('Should emit [loading, loaded] after succesfull repository answer', () async {
    when(() => mock.getLatestRaceWinners()).thenAnswer((_) async => throw 'Error');

    expectLater(
      notifier.stream,
      emitsInOrder([
        isA<LatestRaceWinnersLoading>(),
        isA<LatestRaceWinnersFailure>(),
      ]),
    );

    await notifier.load();
  });
}
