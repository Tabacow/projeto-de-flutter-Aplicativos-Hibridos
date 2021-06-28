import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_raid_finderzz_app/components/models/Raid.dart';
import '../poke_card/poke_card.dart';
import '../../services/group_service.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  var pokeListArray;
  var myGuestFC;
  @override
  void initState() {
    super.initState();
    _getFCFromSharedPref();
    getData();
    setState(() {});
  }
  Future<void> _getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      this.myGuestFC=1;
    }
    this.myGuestFC=getFC;
  }
  Future getData() async {
    pokeListArray = await GroupService.getGroupList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  final list = snapshot.data as List;
                  return ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return PokeCard(list[index], int.parse(this.myGuestFC));
                      });
                } else {
                  return Text("Carregando...");
                }
              }),
        ),
      ),
    );
  }
}
