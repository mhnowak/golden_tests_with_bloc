import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_tests_with_bloc/model/winners_model.dart';

final winnersRepositoryProvider = Provider((ref) {
  return WinnersRepository();
});

class WinnersRepository {
  WinnersRepository();

  Future<WinnersModel> getLatestRaceWinners() async {
    await Future.delayed(const Duration(seconds: 2));
    return const WinnersModel(
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
    );
  }
}
