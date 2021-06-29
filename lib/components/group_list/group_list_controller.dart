import '../../services/group_service.dart';

class GroupListController {
  getData () async {
    return await GroupService.getGroupList();
  }
}