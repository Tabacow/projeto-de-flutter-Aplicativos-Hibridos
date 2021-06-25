import 'package:flutter/material.dart';
import '../../services/group_service.dart';

class GroupList extends StatefulWidget {



  const GroupList({Key? key}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  var participants;

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
  }

  Future<void> getData () async {
    var participants = await GroupService.getGroupList();
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