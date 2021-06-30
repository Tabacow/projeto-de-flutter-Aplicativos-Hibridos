import 'package:shared_preferences/shared_preferences.dart';

class AccountFormPageController {
  loadNomeData () async {
    var nomeController = await getNomeFromSharedPref();
    return nomeController;
  }
  loadFcData () async {
    var fcController = await getFCFromSharedPref();
    return fcController;
  }
  Future<String> getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return "";
    }
    return getFC;
  }

  Future<String> getNomeFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getNome = prefs.getString("nome");
    if (getNome == null){
      return "";
    }
    return getNome;
  }

  setValuesOnPref(nomeController, fcController) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", nomeController);
    prefs.setString("friendCode", fcController);
  }
}