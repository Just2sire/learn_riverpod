import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_learn/user.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

// FutureProvider
final fetchUserProvider = FutureProvider((ref) {
  String url = "https://jsonplaceholder.typicode.com/users";

  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
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
