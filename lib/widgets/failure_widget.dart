import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: Colors.white,
              size: 86,
            ),
            Text(
              'Unexpected\nError',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
