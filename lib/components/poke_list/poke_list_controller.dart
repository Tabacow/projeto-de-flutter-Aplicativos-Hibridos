import 'dart:convert';
import '../../models/Raid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/group_service.dart';

class PokeListController {
  getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return 1;
    }
    return getFC;
  }
  getData() async {
    var pokeListArray = await GroupService.getGroupList();
    //print(pokeListArray.body);
    var jsonData = jsonDecode(pokeListArray.body);
    List<Raid> raidsList = [];
    for (var raid in jsonData) {
      raidsList.add(Raid(
          raid["id"],
          raid["hostFC"],
          raid["pokemon"]["number"],
          raid["pokemon"]["name"],
          raid["pokemon"]["type1"],
          raid["pokemon"]["type2"]));
    }
    //print(raidsList[0].pokeName);
    return raidsList;
  }
}