import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/group_list/group_list.dart';

class GroupPage extends StatelessWidget {
  

  GroupPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,28.0,8.0,8.0),
        child: Card(
          child: GroupList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pop(context)},
        tooltip: 'Logout',
        child: const Icon(Icons.clear),
      ),
    );
  }
}