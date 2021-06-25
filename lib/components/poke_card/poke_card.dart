
import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';
import '../../services/pokemon_service.dart';

class PokeCard extends StatefulWidget {
  final cardInfo;
  const PokeCard({Key? key, required this.cardInfo}) : super(key: key);

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {

  var pokemon;

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
  }


  Future<void> getData () async {
    pokemon = await PokemonService.getPokemonById(widget.cardInfo["type"]);
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
                 MaterialPageRoute(builder: (context) => GroupPage(participants: widget.cardInfo["participants"])),
               );

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+ widget.cardInfo["type"] +".png"),
                    title: Text(widget.cardInfo["title"]),
                    subtitle: Text(pokemon.name),
                  ),
                  Row(
                    children: <Widget>[
                      Text(widget.cardInfo["description"]),
                      Spacer(),
                      Text(widget.cardInfo["participants"].length.toString()+"/4")
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
