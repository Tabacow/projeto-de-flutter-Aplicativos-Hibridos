import 'package:flutter/material.dart';
import '../poke_card/poke_card.dart';

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);
  final itemCount = 3;
  @override
  Widget build(BuildContext context) {
    return  itemCount > 0
          ? ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: const <Widget>[
          PokeCard(),
          PokeCard(),
          PokeCard(),
          PokeCard(),
          PokeCard(),
          PokeCard(),
          PokeCard(),
          PokeCard()
        ],
      )
        : const Center(child: Text('No items')
    );
  }

}
