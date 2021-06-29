import 'package:flutter/material.dart';
import './group_list_controller.dart';

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
    participants = groupListController.getData(widget.raidId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: FutureBuilder(
              future: groupListController.getData(widget.raidId),
              builder: (context, snapshot) {
                if (snapshot.data != null && this.myGuestFC.runtimeType == "String".runtimeType) {
                  //nome do pokemon, foto, 
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
