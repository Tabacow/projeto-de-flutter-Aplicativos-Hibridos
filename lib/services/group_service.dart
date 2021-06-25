import 'package:dio/dio.dart';
import 'package:ultimate_raid_finderzz_app/models/raidModel.dart';
import '../resources/enviroment_urls.dart';

class GroupService {
  static Future<Raid>? getGroupList () async {
      final res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl);
      return Raid.fromJson(res.data);
    
  }
  static Future createGroup(FC) async {
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + FC);
      return res;
    } catch (e) {
      print(e);
    }
  }
  static Future joinGroup(id) async {
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id);
      return res;
    } catch (e) {
      print(e);
    }
  }
}