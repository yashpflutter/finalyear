import 'package:flutter/material.dart';
import 'package:project_handling_app/components/my_button.dart';
import 'package:project_handling_app/components/my_textfield.dart';

import 'package:project_handling_app/pages/regsiterpage.dart';

import 'package:project_handling_app/pages/syncpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  TextEditingController testadminncontroller = TextEditingController();

  String level = "Employee";
  int jobno = 2;

  // Function to handle radio button selection
  void handleRadioValueChange(String? value) {
    setState(() {
      level = value!; // Set the selected value
      if (level == "Manager") {
        jobno = 1;
        print("Team lead selected, jobno = $jobno");
      } else if (level == "Team lead") {
        jobno = 2;
        print("Employee selected, jobno = $jobno");
      } else if (level == "Employee") {
        jobno = 3;
        print("Manager selected, jobno = $jobno");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login_outlined, size: 60, color: Colors.white),
            const SizedBox(height: 20),

            const Text(
              "Welcome back, you've missed!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: "Employee",
                  groupValue: level,
                  onChanged:
                      handleRadioValueChange, // Corrected: Pass the function, not the function call
                ),
                const Text("Employee", style: TextStyle(color: Colors.white)),
                Radio(
                  activeColor: Colors.blue,
                  value: "Team lead",
                  groupValue: level,
                  onChanged:
                      handleRadioValueChange, // Corrected: Pass the function
                ),
                const Text("Team lead", style: TextStyle(color: Colors.white)),
                Radio(
                  activeColor: Colors.blue,
                  value: "Manager",
                  groupValue: level,
                  onChanged:
                      handleRadioValueChange, // Corrected: Pass the function
                ),
                const Text("Manager", style: TextStyle(color: Colors.white)),
              ],
            ),

            const SizedBox(height: 25),

            // Email TextField
            MyTextField(
              keyboardtype: TextInputType.emailAddress,
              obscureText: false,
              hintText: "Email",
              stylecolor: Colors.white,
              controller: _emailcontroller,
            ),
            const SizedBox(height: 25),

            // Password TextField
            MyTextField(
              keyboardtype: TextInputType.text,
              stylecolor: Colors.white,
              obscureText: true,
              hintText: "Password",
              controller: _pwcontroller,
            ),
            const SizedBox(height: 25),

            // Login button
            MyButton(
              buttoncolor: Colors.lightBlue,
              text: "Login",
              onTap: () {
                // Navigate to LoadingPage and pass the selected jobno
                int valuetosend = jobno;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingPage(data: valuetosend),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),

            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a member?",
                  style: TextStyle(color: Color.fromARGB(255, 84, 83, 83)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Registerpage(),
                      ),
                    );
                  },
                  child: const Text(
                    " Register now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
