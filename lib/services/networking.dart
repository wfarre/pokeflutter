import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/models/pokemon.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getAllFinalPokemons(int pageSize, int pageKey) async {
    List allPokemons = [];
    List pokemons = await getPokemons(pageSize, pageKey);

    await Future.wait(pokemons.map((pkmn) async {
      var pokemonData = await getPokemonData(pkmn['name']);
      allPokemons.add(pokemonData);
    }).toList());

    allPokemons.sort((a, b) => a?.id.compareTo(b?.id));

    return allPokemons;
  }

  Future getPokemons(int pageSize, int pageKey) async {
    try {
      var parsedUrl = Uri.parse('$url?limit=$pageSize&offset=$pageKey');

      http.Response response = await http.get(parsedUrl);

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse['results'];
      }
    } catch (e) {
      print('error: $e');
    }
    return null;
  }

  Future getPokemonData(String pokemonName) async {
    try {
      var parsedUrl = Uri.parse('$url/$pokemonName');

      http.Response response = await http.get(parsedUrl);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return Pokemon.fromJson(decodedResponse);
      }
    } catch (e) {
      print('error: $e');
    }
    return null;
  }
}
