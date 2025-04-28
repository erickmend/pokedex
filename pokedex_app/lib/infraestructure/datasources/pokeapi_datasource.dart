
import 'package:pokedex_app/domain/datasources/pokedex_datasource.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';

class PokeapiDatasource implements PokedexDatasource{
  @override
  Future<List<Pokemon>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}