import 'package:http/http.dart' as http;
import '../resources/enviroment_urls.dart';
class GroupService {
  static Future getGroupList () async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id);
    var res = await http.get(url);
    return res;
  }
  static Future createGroup(FC) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + FC);
    var res = await http.post(url, );
    return res;
  }
  static Future joinGroup(id) async {
    var url = Uri.parse(EnviromentURLs.baseUrl + EnviromentURLs.groupUrl + id);
    var res = await http.get(url);
    return res;
  }
}