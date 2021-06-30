import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';
import './create_group_controller.dart';
import 'dart:async';

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
    Timer.periodic(Duration(seconds: 5), (timer) {
      this.pokeOptions = createGroupController.getData();
    });
    setState(() {});
  }

  Future<void> loadData() async {
    this.hostFC = await createGroupController.getFCFromSharedPref();
  }

  Future<void> redirectToCreatedGroup (list,index) async {
    createGroupController.createRaid(this.hostFC, list[index].pokeNumber).then((res){
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GroupPage(res.body)),
      );
    });
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
                            redirectToCreatedGroup (list, index);
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