import 'package:dio/dio.dart';
import '../resources/enviroment_urls.dart';

class PokemonService {
  static Future getPokemonById (id) async {
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl + "/" + id);
      return res;
    } catch (e) {
      print(e);
    }
  }
  static Future getAllPokemons () async {
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl);
          return res;
      } catch (e) {
        print(e);
    }
  }
}