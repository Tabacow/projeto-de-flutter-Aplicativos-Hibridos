import 'package:flutter/material.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  State<AccountForm> createState() => _AccountForm();
}

class _AccountForm extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final fcController = TextEditingController();

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
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        print(nomeController.text);
                        print(fcController.text);
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
