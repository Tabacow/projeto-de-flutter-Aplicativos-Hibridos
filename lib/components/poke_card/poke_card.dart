
import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/group_page/group_page.dart';


class PokeCard extends StatelessWidget {
  const PokeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Raid do Zé'),
                    subtitle: Text('Mewtwo Raid'),
                  ),
                  Row(
                    children: <Widget>[
                      Text("Só aceito gente com Pikachu"),
                      Spacer(),
                      Text("1/4")
                    ],
                  )
                ],
              ),
            ),
            ),
          ),

    );
  }
}
