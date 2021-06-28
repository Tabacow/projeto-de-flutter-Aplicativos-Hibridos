
import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/models/Raid.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';
import 'package:ultimate_raid_finderzz_app/services/group_service.dart';
import '../../services/pokemon_service.dart';

/*class PokeCard extends StatefulWidget {
  final cardInfo;
  const PokeCard({Key? key, required this.cardInfo}) : super(key: key);

  @override
  _PokeCardState createState() => _PokeCardState();
}*/

class PokeCard extends StatelessWidget{
  //var groupService = GroupService();
  
  var raidInfo;
  var myGuestFC;
  PokeCard(this.raidInfo, this.myGuestFC);

  /*@override
  void initState() {
    super.initState();
    //getData();
    setState(() {});
  }*/


  /*Future<void> getData () async {
    pokemon = await PokemonService.getPokemonById(widget.cardInfo["type"]);
  }*/
  getType(pokeType1, pokeType2){
    if(pokeType2!="None")
      return pokeType1 + " " + pokeType2;
    
    else
      return pokeType1;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
           onTap: () {
              print(this.myGuestFC);
                GroupService.joinRaid(raidInfo.id, this.myGuestFC);
               

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+raidInfo.pokeNumber.toString()+".png"),
                    title: Text(raidInfo.pokeName),
                    subtitle: Text(getType(raidInfo.pokeType1, raidInfo.pokeType2)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(raidInfo.hostFC.toString()),
                      Spacer(),
                      Text(raidInfo.id.toString())
                    ],
                  )
                ],
              ),
            ),
            ),
          ),
    );
  }
 
}
