
import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';
import 'package:ultimate_raid_finderzz_app/services/group_service.dart';
import 'pode_card_controller.dart';


class PokeCard extends StatelessWidget{

  var raidInfo;
  var myGuestFC;
  PokeCard(this.raidInfo, this.myGuestFC);
  final pokeCardController = new PokeCardController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
           onTap: () {
                GroupService.joinRaid(raidInfo.id, this.myGuestFC).then((res) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupPage(raidInfo.id)),
                  );
                });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+raidInfo.pokeNumber.toString()+".png"),
                    title: Text(raidInfo.pokeName),
                    subtitle: Text(pokeCardController.getType(raidInfo.pokeType1, raidInfo.pokeType2)),
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
