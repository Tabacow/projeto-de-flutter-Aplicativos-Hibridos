import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/poke_card/poke_card.dart';
import './group_list_controller.dart';
import '../../models/Group.dart';

class GroupList extends StatefulWidget {
  final raidId;
  const GroupList({Key? key, required this.raidId}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  var participants;
  var myGuestFC;
  final groupListController = new GroupListController();

  @override
  void initState() {
    super.initState();
    groupListController.getFCFromSharedPref();
    participants = () async { await groupListController.getData(widget.raidId) as Group;};
    new Timer.periodic(const Duration(seconds: 25), (Timer t) => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: FutureBuilder(
              future: groupListController.getData(widget.raidId),
              builder: (context, snapshot) {
                if (snapshot.data != null ) {
                  var group = snapshot.data as Group;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("ID da sala: "),
                            Text(group.id.toString()),

                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Spacer(),
                            Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" + group.pokemonId.toString() + ".png", scale: 0.3,),
                            Spacer()
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(group.pokemonName),
                            Spacer()
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Text("Tipo 1: " + group.pokemonType1),

                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(((){return group.pokemonType2 != "None" ? "Tipo 2: " + group.pokemonType2 : "";})()),

                              ],
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                              Text("Jogador 1: "),
                              Text((() {
                                if(group.hostFC != null){
                                   return group.hostFC.toString();
                                }
                                else {
                                  return "Esperando...";
                                }
                              })())
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Jogador 2: "),
                            Text((() {
                              if(group.guestFC1 != null){
                                return group.guestFC1.toString();
                              }
                              else {
                                return "Esperando...";
                              }
                            })())
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Jogador 3: "),

                            Text((() {
                              if(group.guestFC2 != null){
                                return group.guestFC2.toString();
                              }
                              else {
                                return "Esperando...";
                              }
                            })())

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Jogador 4: "),
                            Text((() {
                              if(group.guestFC3 != null){
                                return group.guestFC3.toString();
                              }
                              else {
                                return "Esperando...";
                              }
                            })())
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text("Carregando...");
                }
              }),
        );
    
    /*
    ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: participants.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(participants[index]["name"]),
            Spacer(),
            Text(participants[index]["friendCode"])
          ],
        ),
      ),
    );*/
  }
}
