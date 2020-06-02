import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/resources/rounded_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Color(0xFF2699FB),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0,top: 40.0),
                  child: Image(
                    image: AssetImage('assets/images/bag.jpg'),
                    height: 78.46,
                    width: 78,
                  ),
                ),
              ],
            ),
            Text(
              'Grocery App',
              style: kAppNameText,
            ),
            Text(
              'Create New Account',
              style: TextStyle(
                  color: Color(0xFF2699FB),
                  fontSize: 20.0
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField()
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(),
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
            ),
            Container(
              height: 4.0,
              width: 44.0,
              color: Color(0xFFBCE0FD),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.only(left: 230.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)
                ),
                color: Color(0xFF2699FB),
              ),
              child: Center(
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
