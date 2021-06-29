

import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/poke_list/poke_list_controller.dart';
import '../poke_card/poke_card.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  var pokeListArray;
  var myGuestFC;
  final pokeListController = new PokeListController();
  @override
  void initState() {
    super.initState();
    getMyGuestFC();
    pokeListArray = pokeListController.getData();

    setState(() {});
  }

  getMyGuestFC() async {
    myGuestFC = await pokeListController.getFCFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: FutureBuilder(
              future: pokeListController.getData(),
              builder: (context, snapshot) {
                if (snapshot.data != null && this.myGuestFC.runtimeType == "String".runtimeType) {
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
