
import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';
import '../../resources/pokemons.dart';

class PokeCard extends StatelessWidget {
  final cardInfo;
  const PokeCard({Key? key, required this.cardInfo}) : super(key: key);

  caralho() {
    var pokemon = Pokemons.legendaries.where((element) => element["pokeId"].toString() == cardInfo["type"]);
    return pokemon.first["name"];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => GroupPage(participants: cardInfo["participants"])),
               );

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+ cardInfo["type"] +".png"),
                    title: Text(cardInfo["title"]),
                    subtitle: Text(caralho()),
                  ),
                  Row(
                    children: <Widget>[
                      Text(cardInfo["description"]),
                      Spacer(),
                      Text(cardInfo["participants"].length.toString()+"/4")
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
