import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/home_screen.dart';
import 'package:riverpod_learn/user.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

// FutureProvider


// Family keyword help us to pass parameters

// autoDispose helps to dispose provider when not in use to avoid memory leaks

final fetchUserProvider = FutureProvider.family.autoDispose((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

final streamProvider = StreamProvider((ref) async* {
  // Firebase exple
  // return FirebaseFirestore.collection('users').doc(userId).snapshots();
  List<int> values = [];
  for (var i = 0; i < 20; i++) {
    values.add(i);
  }
  yield values;
});

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
