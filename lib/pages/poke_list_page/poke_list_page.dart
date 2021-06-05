import 'package:flutter/material.dart';
import 'package:ultimate_raid_finderzz_app/pages/create_group_page/create_group_page.dart';
import '../../components/poke_list/poke_list.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateGroupPage()),
        )
        },
        tooltip: 'Create Group',
        child: const Icon(Icons.add),
      ),
      body: PokeList()
    );
  }
}