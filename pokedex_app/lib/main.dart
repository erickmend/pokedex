import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/pokemon_providers.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: MyHomePage(title: 'Pokedex - flutter app')
      ),
    );
  }
}






class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pokemonListProvider);
    final selectedPokemon = ref.watch(selectedPokemonProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(pokemonListProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (selectedPokemon != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Has seleccionado: ${selectedPokemon.name}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: pokemonList.when(
              data: (pokemons) => ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return ListTile(
                    title: Text(pokemon.name),
                    onTap: () {
                      ref.read(selectedPokemonProvider.notifier).select(pokemon);
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lo sentimos, ha ocurrido un error')),
            ),
          ),
        ],
      ),
    );
  }
}
