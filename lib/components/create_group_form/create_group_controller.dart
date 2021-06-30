import 'package:ultimate_raid_finderzz_app/services/group_service.dart';
import '../../services/pokemon_service.dart';
import '../../models/Pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class CreateGroupController {



  final groupService = new GroupService();

  getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return 1;
    }
    return int.parse(getFC);
  }

  Future createRaid(hostFC, pokeNumber) {
    return groupService.createRaid(hostFC, pokeNumber );
  }

  getData() async {
    var pokeOptions = [];
    var pokeListArray = await PokemonService.getAllPokemons();
    //print(pokeListArray.body);
    var jsonData = jsonDecode(pokeListArray.body);
    for (var pokemon in jsonData) {
      pokeOptions.add(Pokemon(pokemon["number"],pokemon["name"],pokemon["type1"],pokemon["type2"]));
    }
    return pokeOptions;
  }
}