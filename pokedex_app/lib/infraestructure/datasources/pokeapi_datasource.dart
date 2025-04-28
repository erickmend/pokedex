
import 'package:dio/dio.dart';
import 'package:pokedex_app/domain/datasources/pokedex_datasource.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/infraestructure/mappers/pokemon_mapper.dart';
import 'package:pokedex_app/infraestructure/models/pokemon_list_response.dart';

class PokeapiDatasource implements PokedexDatasource{
  
    final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2',
  ));

  @override
  Future<List<Pokemon>> get() async {
    final response = await dio.get(
      '/pokemon'
    );

    final castResponse = PokemonListResponse.fromJson(response.data);

    List<Pokemon> pokemons = castResponse.pokemons.map(
      (pokeitem) => PokemonMapper.pokemonToEntity(pokeitem)
    ).toList();
    
    return pokemons;
  }
}