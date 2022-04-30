import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocerfrees/authenticationservice.dart';
import 'package:grocerfrees/home.dart';
import 'package:grocerfrees/login.dart';
import 'package:grocerfrees/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance)),
          StreamProvider(
              create: ((context) =>
                  context.read<AuthenticationService>().authStateChanges),
              initialData: null),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          home: AuthenticationWrapper(),
        ));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    if (firebaseuser != null) {
      return HomePage();
    }

    return SignInPage();
  }
}
