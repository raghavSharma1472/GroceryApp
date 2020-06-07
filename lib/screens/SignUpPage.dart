import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/widgets/custom_text_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import 'package:groceryhome/services/signingUp.dart';

class SignUpPage extends StatelessWidget {
  static String id = 'SignUpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: ModalProgressHUD(
        inAsyncCall: context.watch<UserData>().getSpinner,
        child: SafeArea(
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
                    context.read<UserData>().setName(value);
                  },
                ),
                CustomTextField(
                    preset: 'johndoe@mail.com',
                    hint: 'Email',
                    padding: 10.0,
                    keyboardType: TextInputType.emailAddress,
                    onChangedCallback: (String value) {
                      context.read<UserData>().setEmail(value);
                    }),
                CustomTextField(
                  preset: '9696969696',
                  hint: 'Mobile No',
                  padding: 10.0,
                  keyboardType: TextInputType.phone,
                  onChangedCallback: (String value) {
                    context.read<UserData>().setNumber(value);
                  },
                ),
                CustomTextField(
                  preset: '••••••••',
                  hint: 'Password',
                  padding: 10.0,
                  obscureText: true,
                  onChangedCallback: (String value) {
                    context.read<UserData>().setPassword(value);
                  },
                ),
                CustomTextField(
                  preset: '••••••••',
                  hint: 'Comfirm Password',
                  padding: 10.0,
                  obscureText: true,
                  onChangedCallback: (String value) {
                    context.read<UserData>().setConfirmPassword(value);
                  },
                ),
                Container(
                  height: 4.0,
                  width: 44.0,
                  color: Color(0xFFBCE0FD),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 18),
                GestureDetector(
                  onTap: () async {
                    //TODO Password Match
                    // if (Provider.of<UserData>(context).getConfirmPassword !=
                    //         Provider.of<UserData>(context).getPassword &&
                    //     Provider.of<UserData>(context).getPassword != '') {
                    // } else {
                    try {
                      if (!context.read<UserData>().isConnected) {
                        SignUpUser().signUpUser(context);
                      }
                    } catch (e) {
                      print(e);
                    }
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
                  // height: MediaQuery.of(context).size.height / 8,
                  height: 40.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
