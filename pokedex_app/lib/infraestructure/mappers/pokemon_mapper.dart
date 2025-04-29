import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/infraestructure/models/pokemon_list_response.dart';

class PokemonMapper {
  static Pokemon pokemonToEntity( PokemonItem pokemon ) =>
      Pokemon(
        name: pokemon.name, 
        imgUrl: pokemon.url, 
      );
}


