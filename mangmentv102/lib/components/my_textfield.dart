// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyTextField extends StatelessWidget {
//   final String hintText;
//   final bool obscureText;
//   final TextEditingController controller;
//   final TextInputType keyboardtype;
//   final FocusNode _focusNode = FocusNode();
//   final List<TextInputFormatter> inputfromator;
//   final String? Function(String?)? validator;

//   // Add a constructor to accept validator and other parameters
//   MyTextField({
//     super.key,
//     required this.validator,
//     required this.keyboardtype,
//     required this.hintText,
//     required this.obscureText,
//     required this.controller,
//     required this.inputfromator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: TextFormField(
//         // Use the validator here
//         validator: validator,
//         inputFormatters: inputfromator,
//         style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//         keyboardType: keyboardtype,
//         focusNode: _focusNode,
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: Theme.of(context).colorScheme.tertiary),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Theme.of(context).colorScheme.inversePrimary),
//             ),
//             enabled: true,
//             fillColor: const Color.fromARGB(0, 255, 255, 255),
//             filled: true,
//             hintText: hintText,
//             hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
//             errorStyle:
//                 TextStyle(color: const Color.fromARGB(179, 41, 18, 18))),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardtype;
  final List<TextInputFormatter> inputfromator;
  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardtype,
    required this.inputfromator,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardtype,
        inputFormatters: inputfromator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white10,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(12),
          ),
          errorStyle: const TextStyle(
            color: Colors.orange, // 🔸 Customize error text color here
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
