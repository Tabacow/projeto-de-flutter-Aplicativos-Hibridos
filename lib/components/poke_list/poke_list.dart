import 'package:flutter/material.dart';
import '../poke_card/poke_card.dart';

class PokeListArray {
  static const pokeListArray = [
    {
      "title": "Raid do zé",
      "type": "150",
      "description" : "Só aceito gente com Pikachu",
      "participants" : [
          {
            "name" : "Zé",
            "friendCode" : "1"
          },
          {
            "name" : "Scat",
            "friendCode" : "2"
          }
        ],
      "id" : "AB12CD34"
    },
    {
      "title": "Raid do Bozo",
      "type": "146",
      "description" : "Só aceito gente com Machop",
      "participants" : [
        {
          "name" : "sum fuk",
          "friendCode" : "3"
        }
      ],
      "id" : "AB12CD56"
    },
    {
      "title": "Raid do Scat",
      "type": "145",
      "description" : "Cola ai",
      "participants" : [
        {
          "name" : "becky",
          "friendCode" : "4"
        },
        {
          "name" : "you want",
          "friendCode" : "5"
        },
        {
          "name" : "sum fuk",
          "friendCode" : "6"
        },
        {
          "name" : "??",
          "friendCode" : "7"
        },
      ],
      "id" : "AB12CD78"
    },
    {
      "title": "Raid do Rondo",
      "type": "383",
      "description" : "Cola ai",
      "participants" : [
        {
          "name" : "Cristino",
          "friendCode" : "4"
        },
        {
          "name" : "",
          "friendCode" : "5"
        },
        {
          "name" : "",
          "friendCode" : "6"
        },
        {
          "name" : "??",
          "friendCode" : "7"
        },
      ],
      "id" : "AB12CD78"
    },
    {
      "title": "Raid da Sirene",
      "type": "383",
      "description" : "Cola ai",
      "participants" : [
        {
          "name" : "Ronaldinho",
          "friendCode" : "4"
        },
        {
          "name" : "R10",
          "friendCode" : "5"
        },
        {
          "name" : "Hector",
          "friendCode" : "6"
        },
        {
          "name" : "Flutter",
          "friendCode" : "7"
        },
      ],
      "id" : "AB12CD78"
    },
  ];
}

class PokeList extends StatelessWidget {


  const PokeList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  PokeListArray.pokeListArray.length > 0
          ? ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        itemCount: PokeListArray.pokeListArray.length,
        itemBuilder: (context, index) {
          return PokeCard(cardInfo: PokeListArray.pokeListArray[index]);
        },
      )
        : const Center(child: Text('No rooms available')
    );
  }

}
