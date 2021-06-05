import 'package:flutter/material.dart';
import '../../components/account_form/account_form.dart';

class AccountFormPage extends StatelessWidget {
  const AccountFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Logout',
          child: const Icon(Icons.logout),
        ),
        body: AccountForm()
    );
  }
}