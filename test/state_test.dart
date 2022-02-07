import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class FooNotifier extends StateNotifier<int> {
  FooNotifier() : super(0);
}

class MockFooNotifier extends Mock implements FooNotifier {}

void main() {
  MockFooNotifier mock = MockFooNotifier();
  when(() => mock.state).thenReturn(1);
}
