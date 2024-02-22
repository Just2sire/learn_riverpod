import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On peut utiliser ça si on veut seulement gérer le cas ou les données sont disponibles
    // ref.watch(fetchUserProvider).whenData((value) => null);
    //  return ref.watch(fetchUserProvider).when(data: (data) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: const Text("App"),
    //       ),
    //       body: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Center(
    //             child: Text(data.name),
    //           ),
    //         ],
    //       ),
    //     );
    //   }, error: (error, stackTrace) {
    //     return Scaffold(
    //       body: Center(
    //         child: Text(
    //           error.toString(),
    //         ),
    //       ),
    //     );
    //   }, loading: () {
    //     return const Scaffold(
    //       body: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   });
    return Scaffold(
      body: ref.watch(streamProvider).when(
            data: (data) {
              return Center(
                child: Text(
                  data.toString(),
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
              ),
            ),
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
    );
  }
}
