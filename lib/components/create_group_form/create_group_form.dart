import 'package:flutter/material.dart';
import '../select/select.dart';

/// This is the stateful widget that the main application instantiates.
class CreateGroupForm extends StatefulWidget {
  const CreateGroupForm({Key? key}) : super(key: key);

  @override
  State<CreateGroupForm> createState() => _CreateGroupForm();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CreateGroupForm extends State<CreateGroupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nomeRaidController = TextEditingController();
  final descricaoController = TextEditingController();
  final selectValue = new ValueNotifier("Pikachu");

  final legendaryList = ['Mewtwo', 'Pikachu', 'Arceus', 'Regigigas'];

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
                    controller: nomeRaidController,
                    decoration: const InputDecoration(
                      hintText: 'Nome da Raid',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      hintText: 'Descrição',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: selectValue,
                      builder: (context, value, child) {
                        return Select(selectValue: value,options: legendaryList, valueNotifier: selectValue);
                      }
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(selectValue);
                          print(nomeRaidController.text);
                          print(descricaoController.text);
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
