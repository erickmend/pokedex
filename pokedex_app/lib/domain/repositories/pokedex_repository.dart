import 'package:pokedex_app/domain/entities/pokemon.dart';

abstract class PokedexRepository {
  Future<List<Pokemon>> get();
}
