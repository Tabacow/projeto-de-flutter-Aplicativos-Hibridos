import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/account_form/account_form_controller.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  State<AccountForm> createState() => _AccountForm();
}

class _AccountForm extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var fcController = TextEditingController();
  final accountFormController = new AccountFormPageController();

  @override
  void initState() {
    super.initState();
    setData();
    setState((){});
  }

  Future<void> setData() async {
    fcController.text = await accountFormController.loadFcData();
    nomeController.text = await accountFormController.loadNomeData();
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
                        accountFormController.setValuesOnPref(nomeController.text, fcController.text);
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
