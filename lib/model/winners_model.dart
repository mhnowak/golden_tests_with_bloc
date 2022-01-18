class WinnersModel {
  final Driver firstPlace;
  final Driver secondPlace;
  final Driver thirdPlace;

  const WinnersModel({
    required this.firstPlace,
    required this.secondPlace,
    required this.thirdPlace,
  });
}

class Driver {
  const Driver({
    required this.firstName,
    required this.familyName,
  });

  final String firstName;
  final String familyName;
}
