import 'package:dio/dio.dart';
import 'package:ultimate_raid_finderzz_app/models/raidModel.dart';
import '../resources/enviroment_urls.dart';

class GroupService {
  static Future<Raid>? getGroupList () async { // http request para pegar a lista de todos os grupos
      final res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl);
      return Raid.fromJson(res.data);
    
  }
  static Future createGroup(FC) async { // http request para cria um grupo
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + FC);
      return res;
    } catch (e) {
      print(e);
    }
  }
  static Future joinGroup(id) async { // http request realizar a entrada em um grupo
    try {
      var res = await Dio().get(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id);
      return res;
    } catch (e) {
      print(e);
    }
  }
}