import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocerfrees/authenticationservice.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Center(
          child: Text("Home"),
        ),
        ElevatedButton(
            onPressed: (){
              context.read<AuthenticationService>().signOut();
            },
            child: const Text("Sign Out"))
      ]),
    );
  }
}
