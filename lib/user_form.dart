import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/user_provider.dart';

import 'user.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      // instancia da classe user um novo usuario
      User user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text);

      int usersLength = userProvider.users.length;

      //salva um novo usuario
      userProvider.users.insert(usersLength, user);

      //busca o usuario salvo
      print(userProvider.users[0].name);

      Navigator.popAndPushNamed(context, "/list");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
                label: 'Name', isPassword: false, controller: controllerName),
            FieldForm(
                label: 'E-mail',
                isPassword: false,
                controller: controllerEmail),
            FieldForm(
                label: 'Password',
                isPassword: true,
                controller: controllerPassword),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: save,
                child: Text('Salvar'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
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
