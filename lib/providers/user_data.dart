import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _number = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isConnected = false;
  double _latitude;
  double _longitude;
  bool _showSpinner = false;

  bool get getSpinner {
    return _showSpinner;
  }

  void setSpinner() {
    _showSpinner = !_showSpinner;
    notifyListeners();
  }

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

  double get getLatitude => _latitude;
  double get getLongitude => _longitude;

//TODO Add this after implemending Splash Screen
  // void getUserDataLocally() {
  //   SharedPreferences.getInstance().then((value) {
  //     _email = value.getString('email') ?? '';
  //     _password = value.getString('password') ?? '';
  //   });
  //   notifyListeners();
  // }

  void storeUserDataLocally(String email, String password) {
    SharedPreferences.getInstance().then((value) {
      if (value.getString('email') != email) {
        value.setString('email', email);
        value.setString('password', password);
      }
    }).catchError((onError) {
      print(onError);
      print(
          'Fatil Error storing user details locally'); //TODO remove if working fine
    });
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
    print('isConneced: ' + _isConnected.toString());
    notifyListeners();
  }

  void setLongitude(double value) {
    _longitude = value;
    notifyListeners();
  }

  void setLatitude(double value) {
    _latitude = value;
    notifyListeners();
  }
}
