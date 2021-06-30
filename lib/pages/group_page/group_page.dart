import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_raid_finderzz_app/components/group_list/group_list.dart';
import 'package:ultimate_raid_finderzz_app/services/group_service.dart';

class GroupPage extends StatefulWidget {

  var raidId;
  GroupPage(this.raidId);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  var groupService = new GroupService();
  var FC;

  Future<void> loadFcData () async {
    FC = await getFCFromSharedPref();
  }

  Future<String> getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return "";
    }
    return getFC;
  }

  @override
  void initState() {
    loadFcData ();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,28.0,8.0,8.0),
        child: Card(
          child: GroupList(raidId:this.widget.raidId),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          groupService.quitRaid(this.widget.raidId, FC);
          Navigator.pop(context);
        },
        tooltip: 'Logout',
        child: const Icon(Icons.clear),
      ),
    );
  }
}