import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {

  final participants;

  const GroupList({Key? key, required this.participants}) : super(key: key);


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