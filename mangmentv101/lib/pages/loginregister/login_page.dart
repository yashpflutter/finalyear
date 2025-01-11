import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangmentv101/components/my_button.dart';
import 'package:mangmentv101/components/my_textfield.dart';

import 'package:mangmentv101/pages/loginregister/regsiterpage.dart';
import 'package:mangmentv101/provider/credentialprovider/loginprovider.dart';
import 'package:provider/provider.dart';
import 'package:mangmentv101/provider/theme/theme_provider.dart';
import 'package:mangmentv101/pages/loginregister/syncpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    // Provider.of(context).providealldetails();
    if (Provider.of<ThemeProvider>(context, listen: false).isDarkMode) {
    } else {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    }
  }

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _empidcontroller = TextEditingController();
  String level = "";
  int jobno = 0;

  // Function to handle radio button selection
  void handleRadioValueChange(String? value) {
    setState(() {
      level = value!; // Set the selected value
      if (level == "Manager") {
        jobno = 1;
        print("Tmanager selected, jobno = $jobno");
      } else if (level == "Team lead") {
        jobno = 2;
        print("Team lead , jobno = $jobno");
      } else if (level == "Employee") {
        jobno = 3;
        print("employee , jobno = $jobno");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login_outlined,
                size: 60, color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 20),

            Text(
              "Welcome back, you've missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Theme.of(context).colorScheme.inversePrimary,
                  value: "Employee",
                  groupValue: level,
                  onChanged:
                      handleRadioValueChange, // Corrected: Pass the function, not the function call
                ),
                const Text("Employee", style: TextStyle(color: Colors.white)),
                Radio(
                  activeColor: Theme.of(context).colorScheme.inversePrimary,
                  value: "Team lead",
                  groupValue: level,
                  onChanged:
                      handleRadioValueChange, // Corrected: Pass the function
                ),
                const Text("Team lead", style: TextStyle(color: Colors.white)),
                Radio(
                  activeColor: Theme.of(context).colorScheme.inversePrimary,
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
              inputfromator: [],
              keyboardtype: TextInputType.emailAddress,
              obscureText: false,
              hintText: "Email",
              controller: _emailcontroller,
            ),
            const SizedBox(height: 25),
            MyTextField(
              inputfromator: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardtype: TextInputType.number,
              obscureText: false,
              hintText: "Employee Id ",
              controller: _empidcontroller,
            ),
            const SizedBox(height: 25),
            // Password TextField
            MyTextField(
              inputfromator: [],
              obscureText: true,
              hintText: "Password",
              controller: _pwcontroller,
              keyboardtype: TextInputType.text,
            ),
            const SizedBox(height: 25),

            // Login button
            MyButton(
              buttoncolor: Theme.of(context).colorScheme.inversePrimary,
              text: "Login",
              onTap: () {
                int valuetosend = jobno;

                Provider.of<LoginProvider>(context, listen: false)
                    .setUserregter(User(
                  email: _emailcontroller.text.trim(),
                  password: _pwcontroller.text.trim(),
                  designation: jobno,
                  empid: int.tryParse(_empidcontroller.text.trim()) ?? 101,
                ));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingPage(data: valuetosend),
                  ),
                );
                //}
              },
            ),
            const SizedBox(height: 25),

            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary),
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
                  child: Text(
                    " Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
