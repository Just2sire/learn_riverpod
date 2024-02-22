import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/home_screen.dart';
import 'package:riverpod_learn/user.dart';

// StateProvider
// final nameProvider = StateProvider<String?>((ref) => null);

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

// StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    User(
      name: "",
      age: 30,
    ),
  ),
);

// ChangeNotifierProvider
final userChangeNotifier =
    ChangeNotifierProvider((ref) => UserChangeNotifier());
    
// FutureProvider


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
