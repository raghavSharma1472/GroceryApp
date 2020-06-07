import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/screens/FirstScreen.dart';
import 'package:provider/provider.dart';

class SignOutUser {
  void signOutUser(BuildContext context) async {
    if (context.read<UserData>().isConnected)
      // CircularProgressIndicator();
      await FirebaseAuth.instance.signOut();
    print('User Signed Out');
    Navigator.pushNamedAndRemoveUntil(
        context, FirstScreen.id, (route) => false);
    context.read<UserData>().toggleConnected();
    context.read<UserData>().storeUserDataLocally('', '');
  }
}
