import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  User? _user;

  List<User> allDetails = [];
  // Getter for the image

  User? get user => _user;

  void setUserregter(User user) {
    _user = user;
    allDetails.add(user); // Add the user to the list

    notifyListeners();
  }
}

class User {
  String email;
  String password;
  String? name;
  int? designation;
  int? empid;

  User({
    this.name,
    required this.email,
    required this.password,
    this.designation,
    this.empid,
  });
}
