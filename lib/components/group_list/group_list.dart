import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(
            color: Colors.black,
          ),
      itemCount: 4,
      itemBuilder: (context, index) =>
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                children: [
                  Text("Usuario $index"),
                  Spacer(),
                  ElevatedButton(onPressed: ()=> {}, child: Text("Excluir"))
                ],
            ),
          ),
    );
  }

}