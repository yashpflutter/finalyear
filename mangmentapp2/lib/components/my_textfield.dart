import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final Color stylecolor;
  const MyTextField(
      {super.key,
      required this.keyboardtype,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      required this.stylecolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          keyboardType: keyboardtype,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabled: true,
            fillColor: const Color.fromARGB(
                0, 255, 255, 255), // const Color.fromARGB(255, 59, 57, 57),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: stylecolor),
          ),
        ));
  }
}
