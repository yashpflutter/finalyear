//import 'package:chatapp/services/auth/auth_serice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangmentv101/components/my_textfield.dart';
import 'package:mangmentv101/components/my_button.dart';
import 'package:mangmentv101/pages/loginregister/syncpage.dart';
import 'package:mangmentv101/provider/credentialprovider/loginprovider.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();
  final TextEditingController _empidcontroller = TextEditingController();
  final TextEditingController _specialcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonenocontroller = TextEditingController();
  // final void Function()? onTap;
  String level = "Student";
  int jobno = 0;

  /* void register(BuildContext context) async {
    final auth = AuthService();
    if(_groupcontroller.text.length != numberofgroups){
      showDialog(context:context,
      builder:(context)=> AlertDialog(title:Text(///////////////)))
    }

    if()
    if (_pwcontroller.text == _confirmcontroller.text) {
      try {
        auth.signUpWithEmailPassword(_emailcontroller.text, _pwcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password don't Match"),
              ));
    }
  }*/
//Local Validation start

  bool Validation() {
    if (_emailcontroller.text.isEmpty ||
        _pwcontroller.text.isEmpty ||
        _confirmcontroller.text.isEmpty ||
        _empidcontroller.text.isEmpty ||
        _specialcontroller.text.isEmpty ||
        _namecontroller.text.isEmpty ||
        _phonenocontroller.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text("Something is missing",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary))));
      return false;
    }

    if (_pwcontroller.text == _confirmcontroller.text) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text("Password and confirm password don't Match ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary))));
      return false;
    }

    if (_pwcontroller.text.contains('@')) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text("Email Don't Contians @  ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary))));
      return false;
    }

    return true;
  }

//Local vadlidation end
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
            //logo
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              // const Icon(Icons.message, size: 60, color: Colors.green),
              Icon(Icons.app_registration_rounded,
                  size: 60,
                  color: Theme.of(context).colorScheme.inversePrimary),
              const SizedBox(height: 20),
              //Weelcoome back message

              const Text("Lets Create a Account for you  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  )),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          activeColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          value: "Employee",
                          groupValue: level,
                          onChanged: handleRadioValueChange),
                      const Text("Employee",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          activeColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          value: "Team lead",
                          groupValue: level,
                          onChanged: handleRadioValueChange),
                      const Text("Teamlead",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          activeColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          value: "Manager",
                          groupValue: level,
                          onChanged: handleRadioValueChange),
                      const Text("Manager",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),
              //name textfield
              MyTextField(
                inputfromator: [],
                keyboardtype: TextInputType.text,

                //  height: double.maxFinite,
                // width: double.maxFinite,

                obscureText: false,
                hintText: "Name",
                controller: _namecontroller,
              ),
              const SizedBox(height: 25),
              //email TextField
              MyTextField(
                inputfromator: [],
                //  height: double.maxFinite,
                // width: double.maxFinite,
                keyboardtype: TextInputType.emailAddress,
                obscureText: false,
                hintText: "Email ",
                controller: _emailcontroller,
              ),
              const SizedBox(height: 25),

              MyTextField(
                inputfromator: [],
                //height: double.maxFinite,
                //width: double.maxFinite,

                keyboardtype: TextInputType.text,
                obscureText: true,
                hintText: "Password",
                controller: _pwcontroller,
              ),
              const SizedBox(height: 25),
              MyTextField(
                inputfromator: [],
                //height: double.maxFinite,
                //width: double.maxFinite,

                keyboardtype: TextInputType.text,
                obscureText: true,
                hintText: "Confirm password",
                controller: _confirmcontroller,
              ),
              const SizedBox(height: 25),

              MyTextField(
                  inputfromator: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  //height: double.maxFinite,
                  //width: double.maxFinite,

                  keyboardtype: TextInputType.number,
                  hintText: "Employee ID",
                  obscureText: false,
                  controller: _empidcontroller),

              const SizedBox(height: 25),

              //const SizedBox(height: 25),
              //   dvsfdv
              MyButton(
                  //height: double.maxFinite,
                  //width: double.maxFinite,
                  buttoncolor: Theme.of(context).colorScheme.inversePrimary,
                  text: "Register",
                  onTap: () {
                    int valuetosend = jobno;

                    //    if (Validation() == true) {
                    Provider.of<LoginProvider>(context, listen: false)
                        .setUserregter(User(
                      email: _emailcontroller.text.trim(),
                      password: _pwcontroller.text.trim(),
                      name: _namecontroller.text.trim(),
                      designation: jobno,
                      empid: int.tryParse(_empidcontroller.text.trim()) ?? 101,
                    ));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoadingPage(data: valuetosend)));
                  }
                  //}
                  ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member ?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text(" Login ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ]))));
  }
}
