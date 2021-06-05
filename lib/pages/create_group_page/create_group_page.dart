import 'package:flutter/material.dart';
import '../../components/create_group_form/create_group_form.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pop(context)},
          tooltip: 'Logout',
          child: const Icon(Icons.clear),
        ),
        body: CreateGroupForm()
    );
  }
}