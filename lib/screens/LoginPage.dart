import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/screens/HomePage.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';
import 'package:groceryhome/widgets/social_media_circle.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';

class LoginPage extends StatelessWidget {
  static String id = '/LoginPage';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                preset: 'Email/Mobile',
                padding: 20.0,
                keyboardType: TextInputType.emailAddress,
                onChangedCallback: (String value) {
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
                onChangedCallback: (String value) {
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
                    SocialMediaCircle(FontAwesomeIcons.facebookF),
                    SocialMediaCircle(Icons.phone),
                    SocialMediaCircle(FontAwesomeIcons.google),
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
                onTap: () async {
                  await _firebaseAuth
                      .signInWithEmailAndPassword(
                          email: Provider.of<UserData>(context, listen: false)
                              .getEmail,
                          password:
                              Provider.of<UserData>(context, listen: false)
                                  .getPassword)
                      .then((value) {
                    context.read<UserData>().setName(
                        value.user.displayName); //TODO Set other Details too
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePage.id, (e) => false);
                    print('UserSignedIn');
                    context.read<UserData>().toggleConnected();
                    context.read<UserData>().storeUserDataLocally(
                        context.read<UserData>().getEmail,
                        context.read<UserData>().getPassword);
                  }).catchError((onError) {
                    print(onError);
                    print('Error Signing User in');
                  });
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
    );
  }
}
