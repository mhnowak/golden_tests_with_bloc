part of 'latest_race_winners_cubit.dart';

@immutable
abstract class LatestRaceWinnersState {
  const LatestRaceWinnersState();
}

class LatestRaceWinnersInitial extends LatestRaceWinnersState {
  const LatestRaceWinnersInitial();
}

class LatestRaceWinnersLoading extends LatestRaceWinnersState {
  const LatestRaceWinnersLoading();
}

class LatestRaceWinnersLoaded extends LatestRaceWinnersState {
  const LatestRaceWinnersLoaded(this.raceWinners);

  final WinnersModel raceWinners;
}

class LatestRaceWinnersFailure extends LatestRaceWinnersState {
  const LatestRaceWinnersFailure();
}
