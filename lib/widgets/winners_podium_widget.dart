import 'package:flutter/material.dart';
import 'package:golden_tests_with_bloc/widgets/podium_widgets.dart';
import 'package:golden_tests_with_bloc/model/winners_model.dart';

class WinnersPodiumWidget extends StatelessWidget {
  const WinnersPodiumWidget({
    Key? key,
    required this.winnersModel,
  }) : super(key: key);

  final WinnersModel winnersModel;

  @override
  Widget build(BuildContext context) {
    final firstPlace = winnersModel.firstPlace;
    final secondPlace = winnersModel.secondPlace;
    final thirdPlace = winnersModel.thirdPlace;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(flex: 2),
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${secondPlace.firstName}\n${secondPlace.familyName}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const SecondPlacePodiumWidget(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${firstPlace.firstName}\n${firstPlace.familyName}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const FirstPlacePodiumWidget(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${thirdPlace.firstName}\n${thirdPlace.familyName}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const ThirdPlacePodiumWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
