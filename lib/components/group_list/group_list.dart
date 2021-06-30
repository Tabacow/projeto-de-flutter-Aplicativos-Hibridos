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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: FutureBuilder(
              future: groupListController.getData(widget.raidId),
              builder: (context, snapshot) {
                print("caralh");
                print(snapshot);


                if (snapshot.data != null ) {
                  var group = snapshot.data as Group;
                  //nome do pokemon, foto, 
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(group.raidPokemon.number)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(group.hostFC)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(group.guestFC1)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(group.guestFC2)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(group.guestFC3)
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
