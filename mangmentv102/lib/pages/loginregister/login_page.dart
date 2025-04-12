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

    // Set theme if required
    if (Provider.of<ThemeProvider>(context, listen: false).isDarkMode) {
    } else {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    }
  }

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();

  String level = "";
  int jobno = 0;

  // Function to handle radio button selection
  void handleRadioValueChange(String? value) {
    setState(() {
      level = value!; // Set the selected value
      if (level == "Manager") {
        jobno = 1;
        print("Manager selected, jobno = $jobno");
      } else if (level == "Team lead") {
        jobno = 2;
        print("Team lead selected, jobno = $jobno");
      } else if (level == "Employee") {
        jobno = 3;
        print("Employee selected, jobno = $jobno");
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // Enable auto-validation
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login_outlined,
                  size: 60,
                  color: Theme.of(context).colorScheme.inversePrimary),
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
                    onChanged: handleRadioValueChange,
                  ),
                  const Text("Employee", style: TextStyle(color: Colors.white)),
                  Radio(
                    activeColor: Theme.of(context).colorScheme.inversePrimary,
                    value: "Team lead",
                    groupValue: level,
                    onChanged: handleRadioValueChange,
                  ),
                  const Text("Team lead",
                      style: TextStyle(color: Colors.white)),
                  Radio(
                    activeColor: Theme.of(context).colorScheme.inversePrimary,
                    value: "Manager",
                    groupValue: level,
                    onChanged: handleRadioValueChange,
                  ),
                  const Text("Manager", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 25),

              // Email TextField
              MyTextField(
                inputfromator: [],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                keyboardtype: TextInputType.emailAddress,
                obscureText: false,
                hintText: "Email",
                controller: _emailcontroller,
              ),
              const SizedBox(height: 25),

              // Password TextField
              MyTextField(
                inputfromator: [],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }

                  return null;
                },
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

                  if (level.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please select your role (Employee, Team lead, or Manager).'),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return; // Exit early if no role is selected
                  }

                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with login logic
                    Provider.of<LoginProvider>(context, listen: false)
                        .setUserregter(User(
                      email: _emailcontroller.text.trim(),
                      password: _pwcontroller.text.trim(),
                      designation: jobno,
                      name: "name of the user fetch from firebase ",
                      empid: 100001,
                    ));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingPage(data: valuetosend),
                      ),
                    );
                  } else {
                    // Show error using setState or a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Entered email or password is invalid.'),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
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
      ),
    );
  }
}
