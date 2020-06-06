import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _number = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isConnected = false;
  String get getName {
    return _name;
  }

  String get getEmail {
    return _email;
  }

  String get getNumber {
    return _number;
  }

  String get getPassword {
    return _password;
  }

  String get getConfirmPassword {
    return _confirmPassword;
  }

  bool get isConnected {
    return _isConnected;
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setNumber(String number) {
    _number = number;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  void toggleConnected() {
    if (isConnected)
      _isConnected = false;
    else
      _isConnected = true;
    notifyListeners();
  }
}
