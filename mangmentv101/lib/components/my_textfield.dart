import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final FocusNode _focusNode = FocusNode();
  final List<TextInputFormatter> inputfromator;
  MyTextField({
    super.key,
    required this.keyboardtype,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.inputfromator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          inputFormatters: inputfromator,
          style: TextStyle(color: Colors.white),
          keyboardType: keyboardtype,
          focusNode: _focusNode,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            enabled: true,
            fillColor: const Color.fromARGB(
                0, 255, 255, 255), // const Color.fromARGB(255, 59, 57, 57),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ));
  }
}
