import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setUser(String email, String password) {
    _email = email;
    _password = password;
    notifyListeners();
  }
}
