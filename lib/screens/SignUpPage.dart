import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';

import '../constants/constants.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'SignUpPage';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name = '';
  String _email = '';
  String _number = '';
  String _password = '';
  String _confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Hero(
              //   tag: 'AppName',
              //   child: Text(
              //     'Grocery App',
              //     style: kAppNameText,
              //   ),
              // ),
              Text(
                'Create New Account',
                style: kHeadingText,
              ),
              CustomTextField(
                preset: 'John Doe',
                hint: 'Name',
                padding: 10.0,
                onChangedCallback: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              CustomTextField(
                preset: 'johndoe@mail.com',
                hint: 'Email',
                padding: 10.0,
                keyboardType: TextInputType.emailAddress,
                onChangedCallback: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              CustomTextField(
                preset: '9696969696',
                hint: 'Mobile No',
                padding: 10.0,
                keyboardType: TextInputType.phone,
                onChangedCallback: (String value) {
                  setState(() {
                    _number = value;
                  });
                },
              ),
              CustomTextField(
                preset: '••••••••',
                hint: 'Password',
                padding: 10.0,
                obscureText: true,
                onChangedCallback: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              CustomTextField(
                preset: '••••••••',
                hint: 'Comfirm Password',
                padding: 10.0,
                obscureText: true,
                onChangedCallback: (String value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
              ),
              Container(
                height: 4.0,
                width: 44.0,
                color: Color(0xFFBCE0FD),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 18),
              GestureDetector(
                onTap: () {
                  if (_confirmPassword != _password && _password != '')
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords dont Match'),
                      ),
                    );
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
    );
  }
}
