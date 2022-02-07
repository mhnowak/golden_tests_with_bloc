import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_tests_with_bloc/main_page_bloc.dart';
import 'package:golden_tests_with_bloc/main_page_riverpod.dart';
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

class MyRiverpodApp extends StatelessWidget {
  const MyRiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lobby page'),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: const Text('Riverpod'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainPageRiverpod(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
