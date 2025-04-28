
import 'package:pokedex_app/domain/datasources/pokedex_datasource.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/repositories/pokedex_repository.dart';
import 'package:pokedex_app/infraestructure/datasources/pokeapi_datasource.dart';
import 'package:pokedex_app/infraestructure/repositories/pokedex_repository_impl.dart';



import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_providers.g.dart';

@riverpod
PokedexRepository pokedexRepository(ref) {
  PokedexDatasource datasource = PokeapiDatasource();
  return PokedexRepositoryImpl(datasource);
}


@riverpod
class PokemonList extends _$PokemonList {
  late final PokedexRepository repository;

  @override
  Future<List<Pokemon>> build() async {
    repository = ref.watch(pokedexRepositoryProvider); 
    return repository.get();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final result = await repository.get(); 
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}


@riverpod
class SelectedPokemon extends _$SelectedPokemon {
  @override
  Pokemon? build() => null;

  void select(Pokemon pokemon) {
    state = pokemon;
  }

  void clear() {
    state = null;
  }
}