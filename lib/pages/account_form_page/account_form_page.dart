import 'package:flutter/material.dart';
import '../../components/account_form/account_form.dart';

class AccountFormPage extends StatelessWidget {
  const AccountFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AccountForm()
    );
  }
}