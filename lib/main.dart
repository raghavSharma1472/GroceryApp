import 'package:flutter/material.dart';
import 'package:groceryhome/screens/FirstScreen.dart';
import 'package:groceryhome/screens/SignUpPage.dart';
import 'package:groceryhome/screens/SplashScreen.dart';
import 'screens/SplashScreen.dart';
import 'screens/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
    );
  }
}


