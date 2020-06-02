import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/resources/rounded_button.dart';
import 'package:groceryhome/screens/SignUpPage.dart';
class FirstScreen extends StatelessWidget {
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
            Image(
              image: AssetImage('assets/images/bag.jpg'),
              height: 78.46,
              width: 78,
            ),
            Text(
              'Grocery App',
              style: kAppNameText,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  advantages[0],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                    fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[1],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[2],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[3],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[4],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[5],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
                Text(
                  advantages[6],
                  style: TextStyle(
                      color: Color(0xFF2699FB),
                      fontSize: 20.0
                  ),
                ),
              ],
            ),

            Container(
              height: 4.0,
              width: 44.0,
              color: Color(0xFFBCE0FD),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.only(left: 102.0),
              padding: EdgeInsets.only(left: 102.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)
                ),
                color: Color(0xFF2699FB),
              ),
              child: Center(
                child: Text(
                  'SIGNUP',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.only(right: 102.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                border: Border.all(color: Color(0xFF2699FB))
              ),
              padding: EdgeInsets.only(right: 102.0),
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color(0xFF2699FB)
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundIconButton(
                  onPressed: (){},
                  icon: FontAwesomeIcons.facebook,
                ),
                RoundIconButton(
                  onPressed: (){},
                  icon: FontAwesomeIcons.phone,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.googlePlus,
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
