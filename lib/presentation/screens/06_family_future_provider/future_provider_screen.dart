import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_anotations_app/presentation/providers/providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon id: $pokemonId'),
      ),
      body: Center(
          child: pokemonAsync.when(
        data: (data) => Text(data),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const CircularProgressIndicator.adaptive(),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'prev',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                if (pokemonId <= 1) return;
                pokemonId--;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'next',
              child: const Icon(Icons.exposure_plus_1),
              onPressed: () {
                pokemonId++;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
