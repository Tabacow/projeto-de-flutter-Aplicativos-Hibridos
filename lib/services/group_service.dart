import 'dart:convert';
import 'package:http/http.dart' as http;
import '../resources/enviroment_urls.dart';

class GroupService {
  static Future getGroupList () async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl);
    var res = await http.get(url);
    return res;
  }
   Future getRaid(id) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id.toString());
    var res = await http.get(url);
    return res;
  }
  static Future joinRaid(id, guestFC) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + "join/" + id.toString() + "/" + guestFC.toString());
    var res = await http.put(url);
    return res;
  }
  Future quitRaid(id, guestFC) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + "quit/" + id.toString() + "/" + guestFC);
    var res = await http.put(url);
    return res;
  }
  Future<http.Response> createRaid(var hostFC, var pokemonNumber) {
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