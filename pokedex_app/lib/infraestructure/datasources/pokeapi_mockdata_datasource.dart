
import 'package:pokedex_app/domain/datasources/pokedex_datasource.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';

class PokeapiMockdataDatasource implements PokedexDatasource{

  @override
  Future<List<Pokemon>> get() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Pokemon> pokemons = [
      Pokemon(name: 'Charmander', imgUrl: 'https://images.template.net/494381/Pokemon-Logo-Clipart-edit-online.png'),
      Pokemon(name: 'Pikachu', imgUrl: 'https://images.template.net/494381/Pokemon-Logo-Clipart-edit-online.png'),
      Pokemon(name: 'bulbasaur', imgUrl: 'https://images.template.net/494381/Pokemon-Logo-Clipart-edit-online.png'),
      Pokemon(name: 'squirtle', imgUrl: 'https://images.template.net/494381/Pokemon-Logo-Clipart-edit-online.png'),
    ];
    
    return pokemons;
  }
}