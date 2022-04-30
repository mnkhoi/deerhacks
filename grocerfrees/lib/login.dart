import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerfrees/authenticationservice.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(controller: emailcontroller,
        decoration: InputDecoration(labelText: "Email"),),
        TextField(controller: passwordcontroller,
        decoration: InputDecoration(labelText: "Password"),),
        ElevatedButton(onPressed: (){
          context.read<AuthenticationService>().signIn(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim()
          );
        }, child: const Text("Sign In"))
      ]),
    );
  }
}
