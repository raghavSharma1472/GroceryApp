import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'dart:async';

import 'FirstScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 4), (){
      Navigator.pushNamed(context, FirstScreen.id,);
    });
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
            style:
                TextStyle(color: Color(0xFF2699FB), fontFamily: 'book-antiqua'),
          )
        ],
      ),
    );
  }
}
