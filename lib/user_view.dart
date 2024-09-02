import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/user_provider.dart';

import 'user.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Mostar Usuario";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;
      UserProvider;

      int? index;
      
      if (userProvider.indexUser != null) {
        index = userProvider.indexUser;
        controllerName.text = userProvider.userSelected!.name;
        controllerEmail.text = userProvider.userSelected!.email;
        controllerpassword.text = userProvider.userSelected!.
        password;
        }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
                label: 'Name', isPassword: false, controller: controllerName),
                isForm: false,
            FieldForm(
                label: 'E-mail',
                isPassword: false,
                controller: controllerEmail),
                isForm: false,
            FieldForm(
                label: 'Password',
                isPassword: false,
                controller: controllerPassword),
                isForm: false,
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed (context, "/create");
                },
                child: Text('Edit'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  userProvider.indexUser = null;
                  userProvider.users.removeAt(index!);
                  Navigator.popAndPushNamed (context, "/create");
                },
                child: Text('Delete'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
