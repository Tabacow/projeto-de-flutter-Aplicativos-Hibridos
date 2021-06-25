import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  State<AccountForm> createState() => _AccountForm();
}

class _AccountForm extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var fcController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData () async {
    nomeController.text = await _getNomeFromSharedPref();
    fcController.text = await _getFCFromSharedPref();
    setState((){
    });
  }

  Future<String> _getNomeFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getNome = prefs.getString("nome");
    if (getNome == null){
      return "";
    }
    return getNome;
  }
  Future<String> _getFCFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final getFC = prefs.getString("friendCode");
    if (getFC == null){
      return "";
    }
    return getFC;
  }

  void setValuesOnPref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", nomeController.text);
    prefs.setString("friendCode", fcController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(

              children: [
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                controller: fcController,
                  decoration: const InputDecoration(
                    hintText: 'Friend-Code',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setValuesOnPref();
                      }
                    },
                    child: const Text('Submit'),
                  )],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
