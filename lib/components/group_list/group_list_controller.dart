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
    print(raid.body);
    return raid.body as Group;
  }
}