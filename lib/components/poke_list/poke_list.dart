import 'package:flutter/material.dart';
import '../poke_card/poke_card.dart';
import '../../services/group_service.dart';

class PokeList extends StatefulWidget {



  const PokeList({Key? key}) : super(key: key);

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {

  var pokeListArray;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData () async {
    pokeListArray = await GroupService.getGroupList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (pokeListArray != null) {
      return  pokeListArray.length > 0
          ? ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        itemCount: pokeListArray.length,
        itemBuilder: (context, index) {
          return PokeCard(cardInfo: pokeListArray[index]);
        },
      )
          : const Center(child: Text('No rooms available')
      );
    } else {
      return Text("Loading...");
    }
  }
}
