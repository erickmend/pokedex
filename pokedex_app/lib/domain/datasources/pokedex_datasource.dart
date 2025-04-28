import 'package:pokedex_app/domain/entities/pokemon.dart';

abstract class PokedexDatasource {
  Future<List<Pokemon>> get();
}
