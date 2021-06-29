import '../../services/group_service.dart';

class GroupListController {
  getData () async {
    return GroupService.getGroupList();
  }
}