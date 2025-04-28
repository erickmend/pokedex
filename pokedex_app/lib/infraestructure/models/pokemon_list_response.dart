// To parse this JSON data, do
//
//     final pokemonListResponse = pokemonListResponseFromJson(jsonString);

import 'dart:convert';

PokemonListResponse pokemonListResponseFromJson(String str) => PokemonListResponse.fromJson(json.decode(str));

String pokemonListResponseToJson(PokemonListResponse data) => json.encode(data.toJson());

class PokemonListResponse {
    int count;
    String next;
    dynamic previous;
    List<PokemonItem> pokemons;

    PokemonListResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.pokemons,
    });

    factory PokemonListResponse.fromJson(Map<String, dynamic> json) => PokemonListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        pokemons: List<PokemonItem>.from(json["results"].map((x) => PokemonItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "pokemons": List<dynamic>.from(pokemons.map((x) => x.toJson())),
    };
}

class PokemonItem {
    String name;
    String url;

    PokemonItem({
        required this.name,
        required this.url,
    });

    factory PokemonItem.fromJson(Map<String, dynamic> json) => PokemonItem(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
