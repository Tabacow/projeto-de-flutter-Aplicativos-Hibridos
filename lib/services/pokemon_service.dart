import 'package:http/http.dart' as http;
import '../resources/enviroment_urls.dart';

class PokemonService {
  static Future getPokemonById (id) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl + "/" + id);
    var res = await http.get(url);
    return res;
  }
  static Future getAllPokemons () async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.pokemonUrl);
    var res = await http.get(url);
    return res;
  }
}