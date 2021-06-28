import 'package:http/http.dart' as http;

void main(){
  fetch();
}

fetch() async{
  var url = 'http://localhost:8081/';
  var response = await http.get(Uri.http(url, "raid"));
  print(response.body);
}