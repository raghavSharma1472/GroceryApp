import 'package:flutter/material.dart';
import 'package:groceryhome/screens/FirstScreen.dart';
import 'package:groceryhome/screens/HomePage.dart';
import 'package:groceryhome/screens/SignUpPage.dart';
import 'package:groceryhome/screens/SplashScreen.dart';
import 'screens/FirstScreen.dart';
import 'screens/FirstScreen.dart';
import 'screens/LoginPage.dart';
import 'screens/SignUpPage.dart';
import 'screens/SignUpPage.dart';
import 'screens/SplashScreen.dart';
import 'screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          FirstScreen.id: (context) => FirstScreen(),
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          SplashScreen.id: (context) => SplashScreen(),
          HomePage.id: (context) => HomePage(),
        });
  }
}
