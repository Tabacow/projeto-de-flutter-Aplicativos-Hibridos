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
  final groupListController = new GroupListController();

  @override
  void initState() {
    super.initState();
  print(widget.raidId);
    participants = groupListController.getData();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(
            color: Colors.black,
          ),
      itemCount: participants.length,
      itemBuilder: (context, index) =>
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                children: [
                  Text(participants[index]["name"]),
                  Spacer(),
                  Text(participants[index]["friendCode"])
                ],
            ),
          ),
    );
  }
}