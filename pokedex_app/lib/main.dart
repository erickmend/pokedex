import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:msal_auth/msal_auth.dart';
import 'package:pokedex_app/presentation/providers/pokemon_providers.dart';

void main() {
  runApp(
    const ProviderScope(
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
        body: MyHomePage(title: 'Pokedex - Flutter App'),
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  SingleAccountPca? msalAuth;

  Future<void> initializeAuth() async {
    msalAuth = await SingleAccountPca.create(
      clientId: 'f32de515-2761-4c28-8cd8-31637b658375',
      androidConfig: AndroidConfig(
        configFilePath: 'assets/msal_config.json',
        redirectUri: 'msauth://com.ericklogistics.pokedexApp/o3E7M7kUGvrbhggRVfKnQbge1PE%3D',
        
      ),
      appleConfig: AppleConfig(
        authority: 'https://login.microsoftonline.com/common',
        authorityType: AuthorityType.b2c,
        broker: Broker.msAuthenticator,
      ),
    );
  }

Future<void> acquireToken() async  {
    try {
      if (msalAuth == null) {
        await initializeAuth();
      }
      final result = await msalAuth!.acquireToken(scopes: ['user.read']);

      if (result.expiresOn.isBefore(DateTime.now())) {
        await acquireTokenSilent();
      }else{
        print('Token sigue vivo');
      }

      print('Access Token: ${result.accessToken}');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login exitoso!')),
      );
        } catch (e) {
      print('Error en login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en login')),
      );
    }
}


Future<void> acquireTokenSilent() async  {
  try{
      if (msalAuth == null) {
        await initializeAuth();
      }

      final authResult = await msalAuth?.acquireTokenSilent(
            scopes: ['user.read'], // List of string same as "acquireToken()"
            identifier: 'f32de515-2761-4c28-8cd8-31637b658375',
          );

          if(authResult!=null){
            print('Renovación de token');
            print('Auth result: ${authResult.accessToken}');
          }
  }catch (e) {
      print('Error en login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en login')),
      );
  }

}

Future<void> logout() async  {
  try{
      if (msalAuth == null) {
        await initializeAuth();
      }

      final authResult = await msalAuth?.signOut();
              if(authResult!=null){
                print('cierre de sesión exitoso');
              }
  }catch (e) {
      print('Error en login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en login')),
      );
  }

}


 
  @override
  Widget build(BuildContext context) {
    final pokemonList = ref.watch(pokemonListProvider);
    final selectedPokemon = ref.watch(selectedPokemonProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(pokemonListProvider.notifier).refresh();
            },
          ),
                    IconButton(
            icon: const Icon(Icons.login),
            onPressed: acquireToken, // Botón para hacer login
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: acquireTokenSilent, // Botón para hacer login
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout, // Botón para hacer login
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
              error: (e, st) => const Center(child: Text('Lo sentimos, ha ocurrido un error')),
            ),
          ),
        ],
      ),
    );
  }
}
