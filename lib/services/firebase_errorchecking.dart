import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceryhome/providers/user_data.dart';

class FirebaseErrors {
  AlertDialog signUpError(String errorCode, BuildContext context) {
    switch (errorCode) {
      case "ERROR_INVALID_EMAIL":
        return dialogbox(context, "Set a valid Email");
      case "ERROR_WEAK_PASSWORD":
        return dialogbox(context, "Your passoword is not strong enough.");
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return dialogbox(context,
            "Your email address is already in use by a different account.");
      default:
        return dialogbox(context, "An undefined Error happened.");
    }
  }

  AlertDialog signInError(String errorCode, BuildContext context) {
    switch (errorCode) {
      case "ERROR_INVALID_EMAIL":
        return dialogbox(
            context, "Your email address appears to be malformed.");
      case "ERROR_WRONG_PASSWORD":
        return dialogbox(context, "Your password is wrong.");
      case "ERROR_USER_NOT_FOUND":
        return dialogbox(context, "User with this email doesn't exist.");
      case "ERROR_USER_DISABLED":
        return dialogbox(context, "User with this email has been disabled.");
      case "ERROR_TOO_MANY_REQUESTS":
        return dialogbox(context, "Too many requests. Try again later.");
      case "ERROR_OPERATION_NOT_ALLOWED":
        return dialogbox(
            context, "Signing in with Email and Password is not enabled.");
      default:
        return dialogbox(context, "An undefined Error happened.");
    }
  }

  AlertDialog dialogbox(BuildContext context, String errorMessage) {
    return AlertDialog(
      title: Text("Error"),
      content: Text(errorMessage),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<UserData>().setSpinner();
          },
        )
      ],
    );
  }
}
