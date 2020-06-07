import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:provider/provider.dart';

class SignUpUser {
  void signUpUser(BuildContext context) {
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = context.read<UserData>().getName;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: context.read<UserData>().getEmail,
            password: context.read<UserData>().getPassword)
        .then((value) {
      value.user.updateProfile(info);
      //TODO Update Other details like User Image and Ph no too
      Firestore.instance
          .collection('users')
          .document(context.read<UserData>().getEmail)
          .setData({
        'email': context.read<UserData>().getEmail,
        'phone': context.read<UserData>().getNumber,
        'name': context.read<UserData>().getName
      });
      print('${info.displayName} Signed Up');
    }).catchError((onError) {
      print(onError);
      print('Error Signing Up user in Firebase');
    });
  }
}
