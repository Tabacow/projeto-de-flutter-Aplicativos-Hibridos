import 'package:flutter/material.dart';
import './group_list_controller.dart';

class GroupList extends StatefulWidget {

  const GroupList({Key? key}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {

  var participants;
  final groupListController = new GroupListController();

  @override
  void initState() {
    super.initState();
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