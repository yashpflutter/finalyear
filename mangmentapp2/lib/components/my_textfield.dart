import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:provider/provider.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final Color stylecolor;

  const MyTextField({
    super.key,
    required this.keyboardtype,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.stylecolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          keyboardType: keyboardtype,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabled: true,
            fillColor: Color.fromARGB(
                0, 255, 255, 255), // const Color.fromARGB(255, 59, 57, 57),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: stylecolor),
          ),
        ));
  }
}
