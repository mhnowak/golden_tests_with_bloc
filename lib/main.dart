import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_tests_with_bloc/main_page_bloc.dart';
import 'package:golden_tests_with_bloc/repositories/winners_repository.dart';

void main() {
  runApp(const MyBlocApp());
}

class MyBlocApp extends StatelessWidget {
  const MyBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WinnersRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const MainPageBloc(),
      ),
    );
  }
}