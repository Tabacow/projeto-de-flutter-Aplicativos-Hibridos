import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../services/group_service.dart';

class GroupListController {
  getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return "";
    }
    return getFC;
  }
  getData(id) async {
    var raid = await GroupService.getRaid(id);
    print(raid.body);
    return raid;
  }
}