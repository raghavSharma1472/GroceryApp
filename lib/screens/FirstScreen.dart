import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/screens/SignUpPage.dart';
import 'package:groceryhome/widgets/social_media_circle.dart';
import '../constants/constants.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';

class FirstScreen extends StatelessWidget {
  static String id = 'FirstScreen';
  final List<String> advantages = [
    '* Find Groceries Near You',
    '* Go Cashless',
    '* Search for Products',
    '* Find Availability and price',
    '* Track Your Budget',
    '* Find Products That Suit You',
    '* Save Time Avoiding Queues'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'AppIcon',
              child: Image(
                image: AssetImage('assets/images/bag.jpg'),
                height: 78.46,
                width: 78,
              ),
            ),
            Hero(
              tag: 'AppName',
              child: Text(
                'Grocery App',
                style: kAppNameText,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < 6; i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      advantages[i],
                      style: kHeadingText,
                    ),
                  ),
              ],
            ),
            Container(
              height: 4.0,
              width: 44.0,
              color: Color(0xFFBCE0FD),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, SignUpPage.id),
              child: Container(
                height: 48,
                margin: EdgeInsets.only(left: 102.0),
                padding: EdgeInsets.only(left: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                  color: Color(0xFF2699FB),
                ),
                child: Center(
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, LoginPage.id),
              child: Container(
                height: 48,
                margin: EdgeInsets.only(right: 102.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    border: Border.all(color: Color(0xFF2699FB))),
                padding: EdgeInsets.only(right: 40.0),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Color(0xFF2699FB), fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //TODO Linking Social Media for Login/SignUp
                  SocialMediaCircle(FontAwesomeIcons.facebookF),
                  SocialMediaCircle(Icons.phone),
                  SocialMediaCircle(FontAwesomeIcons.google),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
