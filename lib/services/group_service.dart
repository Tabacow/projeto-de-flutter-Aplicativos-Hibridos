import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ultimate_raid_finderzz_app/models/Group.dart';
import '../resources/enviroment_urls.dart';
class GroupService {
  static Future getGroupList () async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl);
    var res = await http.get(url);
    return res;
  }
  static Future createGroup(FC) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + FC);
    var res = await http.post(url, );
    return res;
  }
   Future getRaid(id) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id.toString());
    print(url);
    var res = await http.get(url);
    return res;
  }
  static Future joinRaid(id, guestFC) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id.toString() + "/" + guestFC.toString());
    print(url);
    var res = await http.put(url);
    return res;
  }
  Future<http.Response> createRaid(var hostFC, var pokemonNumber) {
    print(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl);
    return http.post(
      Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'hostFC': hostFC,
        'pokemonNumber': pokemonNumber,
      }),
    );
  
}
}