import 'package:flutter/material.dart';
import '../select/select.dart';
import '../../services/pokemon_service.dart';
import '../../services/group_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateGroupForm extends StatefulWidget {
  const CreateGroupForm({Key? key}) : super(key: key);

  // Essa componente serve para criar um CreateGroupForm

  @override
  State<CreateGroupForm> createState() => _CreateGroupForm();
}

class _CreateGroupForm extends State<CreateGroupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nomeRaidController = TextEditingController();
  final descricaoController = TextEditingController();
  final selectValue = new ValueNotifier(""); // ValueNotifier passado para a componente Select
  var pokeOptions = [""]; // Lista de pokemons passado para a componente Select
  var name;
  var friendCode;

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
  }

  Future<void> createGroup() async {
    name = await _getNomeFromSharedPref();
    friendCode = await _getFCFromSharedPref();
    GroupService.createGroup(friendCode);
  }

  Future<void> getData() async {
    pokeOptions = pokeOptions + await PokemonService.getAllPokemons();
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
                        return Select(selectValue: value,options: pokeOptions, valueNotifier: selectValue);
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
