import 'package:flutter/material.dart';

class SecondPlacePodiumWidget extends StatelessWidget {
  const SecondPlacePodiumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: const Text(
        '2',
        style: TextStyle(
          fontSize: 92,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class FirstPlacePodiumWidget extends StatelessWidget {
  const FirstPlacePodiumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.orange[400],
      alignment: Alignment.center,
      child: const Text(
        '1',
        style: TextStyle(
          fontSize: 116,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ThirdPlacePodiumWidget extends StatelessWidget {
  const ThirdPlacePodiumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.brown[600],
      alignment: Alignment.center,
      child: const Text(
        '3',
        style: TextStyle(
          fontSize: 92,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
