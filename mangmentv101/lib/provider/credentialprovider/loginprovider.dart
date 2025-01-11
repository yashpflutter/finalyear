import 'dart:io';

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
    for (var user in allDetails) {
      print('Name: ${user.name}');
      print('Email: ${user.email}');
      print('Designation: ${user.designation}');
      print('EmpID: ${user.empid}');

      print('---'); // Separator between each user
    }
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
