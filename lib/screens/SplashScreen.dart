import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/bag.jpg'),
          ),
          Text(
            'Grocery App',
            style: kAppNameText,
          ),
          Text(
            'Bringing Groceries at your fingertips',
            style: TextStyle(
                color: Color(0xFF2699FB)
            ),
          )
        ],
      ),
    );
  }
}
