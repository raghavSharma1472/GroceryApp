import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import 'package:groceryhome/services/signingUp.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  static String id = 'SignUpPage';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
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
                    'Create New Account',
                    style: kHeadingText,
                  ),
                  CustomTextField(
                    preset: 'John Doe',
                    hint: 'Name',
                    padding: 10.0,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a valid Name.";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      context.read<UserData>().setName(value);
                    },
                  ),
                  CustomTextField(
                      preset: 'johndoe@mail.com',
                      hint: 'Email',
                      padding: 10.0,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value),
                      onSaved: (String value) {
                        context.read<UserData>().setEmail(value);
                      }),
                  CustomTextField(
                    preset: '9696969696',
                    hint: 'Mobile No',
                    padding: 10.0,
                    keyboardType: TextInputType.phone,
                    validator: (String value) {
                      if (value.length != 10)
                        return 'Please enter a 10 digit number';
                      return null;
                    },
                    onSaved: (String value) {
                      context.read<UserData>().setNumber(value);
                    },
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    preset: '••••••••',
                    hint: 'Password',
                    padding: 10.0,
                    obscureText: true,
                    validator: (value) => pwdValidator(value),
                    onSaved: (String value) {
                      context.read<UserData>().setPassword(value);
                    },
                  ),
                  CustomTextField(
                    preset: '••••••••',
                    hint: 'Comfirm Password',
                    padding: 10.0,
                    obscureText: true,
                    validator: (value) {
                      if (pwdValidator(value) != null)
                        return 'Password must be longer than 8 characters';
                      if (value != _passwordController.text) {
                        return 'Passwords dont Match';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      context.read<UserData>().setConfirmPassword(value);
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
                      if (_formKey.currentState.validate()) {
                        print('Valid Details were Entered');
                        _formKey.currentState.save();
                        try {
                          if (!context.read<UserData>().isConnected) {
                            SignUpUser().signUpUser(context);
                            _passwordController.dispose();
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else
                        print('Validating User Failed while SignUp');
                    },
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
      ),
    );
  }
}
