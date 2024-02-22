import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmitName(WidgetRef ref, String value) {
    ref.read(userChangeNotifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userChangeNotifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangeNotifier).user;

    // final user = ref.watch(userProvider); // Rerender all the widget when a value of user change
    
    // final userSelect = ref.watch(
    //   userProvider.select((value) => value.name),
    // ); // Rerender the widget when the selected property changed
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              onSubmitted: (value) => onSubmitName(ref, value),
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              onSubmitted: (value) => onSubmitAge(ref, value),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Name : ${user.name}"),
          ),
          const SizedBox(
            height: 20,
          ),
          // Center(
          //   child: Text("Age : ${user.age}"),
          // ),
        ],
      ),
    );
  }
}
