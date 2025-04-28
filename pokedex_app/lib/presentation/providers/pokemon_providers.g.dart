// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokedexRepositoryHash() => r'b00c80d1764b1e55ea3ffb26794208626345d709';

/// See also [pokedexRepository].
@ProviderFor(pokedexRepository)
final pokedexRepositoryProvider =
    AutoDisposeProvider<PokedexRepository>.internal(
      pokedexRepository,
      name: r'pokedexRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$pokedexRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PokedexRepositoryRef = AutoDisposeProviderRef<PokedexRepository>;
String _$pokemonListHash() => r'bfb1a5085588268bbfc725f5eede44458c5c9ea5';

/// See also [PokemonList].
@ProviderFor(PokemonList)
final pokemonListProvider =
    AutoDisposeAsyncNotifierProvider<PokemonList, List<Pokemon>>.internal(
      PokemonList.new,
      name: r'pokemonListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$pokemonListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PokemonList = AutoDisposeAsyncNotifier<List<Pokemon>>;
String _$selectedPokemonHash() => r'35ac0a084087f750f35b830cd2483896ca861783';

/// See also [SelectedPokemon].
@ProviderFor(SelectedPokemon)
final selectedPokemonProvider =
    AutoDisposeNotifierProvider<SelectedPokemon, Pokemon?>.internal(
      SelectedPokemon.new,
      name: r'selectedPokemonProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedPokemonHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedPokemon = AutoDisposeNotifier<Pokemon?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
