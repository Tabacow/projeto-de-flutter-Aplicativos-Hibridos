import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/components/poke_list/poke_list.dart';
import 'package:ultimate_raid_finderzz_app/pages/main_page/main_page.dart';
import 'package:ultimate_raid_finderzz_app/services/group_service.dart';
import './create_group_controller.dart';

/// This is the stateful widget that the main application instantiates.
class CreateGroupForm extends StatefulWidget {
  const CreateGroupForm({Key? key}) : super(key: key);

  @override
  State<CreateGroupForm> createState() => _CreateGroupForm();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CreateGroupForm extends State<CreateGroupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final createGroupController = new CreateGroupController();
  var hostFC;
  var pokeOptions;

  @override
  void initState() {
    super.initState();
    loadData();
    this.pokeOptions = createGroupController.getData();
    setState(() {});
  }

  Future<void> loadData() async {
    this.hostFC = await createGroupController.getFCFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecione o pokemon que vocÃª deseja abrir raid")),
      body: Container(
        child: Card(
          child: FutureBuilder(
              future: this.pokeOptions,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  final list = snapshot.data as List;
                  return ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ListTile(
                          leading: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+list[index].pokeNumber.toString()+".png"),
                          title: Text(list[index].pokeName),
                          onTap: (){
                            createGroupController.createRaid(this.hostFC, list[index].pokeNumber );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage()),
                            );
                          },
                        );
                      });
                } else {
                  return Text("Carregando...");
                }
              }),
        ),
      ),
    );
  }
}