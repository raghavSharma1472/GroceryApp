import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';
import 'package:groceryhome/widgets/social_media_circle.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import 'package:groceryhome/services/signingIn.dart';

class LoginPage extends StatelessWidget {
  static String id = '/LoginPage';
  final GlobalKey<FormState> _formKey = GlobalKey();
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: ModalProgressHUD(
        inAsyncCall: context.watch<UserData>().getSpinner,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Color(0xFF2699FB),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Hero(
                          tag: 'AppIcon',
                          child: Image(
                            image: AssetImage('assets/images/bag.jpg'),
                            height: 78.46,
                            width: 78,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0, width: 85.0)
                    ],
                  ),
                  Text(
                    'Login',
                    style: kHeadingText,
                  ),
                  CustomTextField(
                    preset: 'Email/Mobile', //TODO Mobile Number Implemendation
                    padding: 20.0,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => emailValidator(value),
                    onSaved: (String value) {
                      try {
                        Provider.of<UserData>(context, listen: false)
                            .setEmail(value);
                      } catch (e) {
                        Provider.of<UserData>(context, listen: false)
                            .setName(value);
                      }
                    },
                  ),
                  CustomTextField(
                    preset: 'Password',
                    padding: 20.0,
                    obscureText: true,
                    validator: (value) => pwdValidator(value),
                    onSaved: (String value) {
                      Provider.of<UserData>(context, listen: false)
                          .setPassword(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //TODO Linking Social Media for Login/SignUp
                        SocialMediaCircle(
                            containedIcon: FontAwesomeIcons.facebookF),
                        SocialMediaCircle(containedIcon: Icons.phone),
                        SocialMediaCircle(
                            containedIcon: FontAwesomeIcons.google),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 18),
                  Container(
                    height: 4.0,
                    width: 44.0,
                    color: Color(0xFFBCE0FD),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 18),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        SignUserIn().signUserIn(context);
                      } else
                        print('Validating User Failed while Login');
                    }, //TODO Authentication and Logging in with mobile
                    child: Container(
                      height: 48,
                      margin: EdgeInsets.only(left: 230.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                        color: Color(0xFF2699FB),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
