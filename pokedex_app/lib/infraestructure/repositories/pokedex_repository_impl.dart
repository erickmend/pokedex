
import 'package:pokedex_app/domain/datasources/pokedex_datasource.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository{

    final PokedexDatasource dataSource;

  PokedexRepositoryImpl(this.dataSource);

  @override
  Future<List<Pokemon>> get() async {
    return await dataSource.get();
  }
}