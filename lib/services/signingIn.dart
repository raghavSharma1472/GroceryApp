import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/screens/HomePage.dart';
import 'package:provider/provider.dart';

class SignUserIn {
  void signUserIn(BuildContext context) {
    context.read<UserData>().setSpinner();
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: Provider.of<UserData>(context, listen: false).getEmail,
            password: Provider.of<UserData>(context, listen: false).getPassword)
        .then((value) {
      context.read<UserData>().setName(
          value.user.displayName ?? 'User'); //TODO Set other Details too
      print('${value.user.displayName ?? 'User'} SignedIn');
      context.read<UserData>().toggleConnected();
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (e) => false);
      context.read<UserData>().setSpinner();
      context.read<UserData>().storeUserDataLocally(
          context.read<UserData>().getEmail,
          context.read<UserData>().getPassword);
    }).catchError((onError) {
      print(onError);
      print('Error Signing User in');
    });
  }
}
