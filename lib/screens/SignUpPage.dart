import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/screens/FirstScreen.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';
import '../constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  static String id = 'SignUpPage';
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserData(),
      child: Scaffold(
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
                  'Create New Account',
                  style: kHeadingText,
                ),
                CustomTextField(
                  preset: 'John Doe',
                  hint: 'Name',
                  padding: 10.0,
                  onChangedCallback: (String value) {
                    Provider.of<UserData>(context).setName(value);
                  },
                ),
                CustomTextField(
                    preset: 'johndoe@mail.com',
                    hint: 'Email',
                    padding: 10.0,
                    keyboardType: TextInputType.emailAddress,
                    onChangedCallback: (String value) {
                      Provider.of<UserData>(context).setEmail(value);
                    }),
                CustomTextField(
                  preset: '9696969696',
                  hint: 'Mobile No',
                  padding: 10.0,
                  keyboardType: TextInputType.phone,
                  onChangedCallback: (String value) {
                    Provider.of<UserData>(context).setNumber(value);
                  },
                ),
                CustomTextField(
                  preset: '••••••••',
                  hint: 'Password',
                  padding: 10.0,
                  obscureText: true,
                  onChangedCallback: (String value) {
                    Provider.of<UserData>(context).setPassword(value);
                  },
                ),
                CustomTextField(
                  preset: '••••••••',
                  hint: 'Comfirm Password',
                  padding: 10.0,
                  obscureText: true,
                  onChangedCallback: (String value) {
                    Provider.of<UserData>(context).setPassword(value);
                  },
                ),
                Container(
                  height: 4.0,
                  width: 44.0,
                  color: Color(0xFFBCE0FD),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 18),
                GestureDetector(
                  onTap: () async {
                    if (Provider.of<UserData>(
                              context,
                            ).getConfirmPassword !=
                            Provider.of<UserData>(context).getPassword &&
                        Provider.of<UserData>(context).getPassword != '') {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Passwords dont Match'),
                        ),
                      );
                    } else {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: Provider.of<UserData>(
                                  context,
                                ).getEmail,
                                password: Provider.of<UserData>(
                                  context,
                                ).getPassword);
                        if (newUser != null) {
                          Navigator.pushNamed(context, FirstScreen.id);
                        }
                        _firestore
                            .collection('users')
                            .document(Provider.of<UserData>(context).getEmail)
                            .setData({
                          'email': Provider.of<UserData>(
                            context,
                          ).getEmail,
                          'phone': Provider.of<UserData>(
                            context,
                          ).getNumber,
                          'password': Provider.of<UserData>(
                            context,
                          ).getPassword,
                          'name': Provider.of<UserData>(
                            context,
                          ).getName
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  }, //TODO Implemending New User Creation
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
                        'SIGN UP',
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
    );
  }
}
