import 'package:dio/dio.dart';
import '../resources/enviroment_urls.dart';

class PokemonService {
  static Future getPokemonById (id) async { // http request para pegar as informações do pokemon pelo id
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl + "/" + id);
      return res;
    } catch (e) {
      print(e);
    }
  }
  static Future getAllPokemons () async { // http request para pegar a lista de todos os pokemons
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl);
          return res;
      } catch (e) {
        print(e);
    }
  }
}