import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_raid_finderzz_app/models/Group.dart';
import '../../services/group_service.dart';

class GroupListController {

  var groupService = new GroupService();

  getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return "";
    }
    return getFC;
  }
  Future getData(id) async {
    var raid = await groupService.getRaid(id);
    var jsonData = jsonDecode(raid.body);
    print(jsonData);
    var group = new Group(jsonData["id"], jsonData["pokemon"]["name"], jsonData["hostFC"], jsonData["guestFC1"], jsonData["guestFC2"], jsonData["guestFC3"]);
    return group;
  }
}