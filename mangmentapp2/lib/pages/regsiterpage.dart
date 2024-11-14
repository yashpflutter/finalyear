//import 'package:chatapp/services/auth/auth_serice.dart';
import 'package:flutter/material.dart';
import 'package:project_handling_app/components/my_textfield.dart';
import 'package:project_handling_app/components/my_button.dart';
import 'package:project_handling_app/pages/syncpage.dart';

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
  // final void Function()? onTap;
  String level = "Student";
  int jobno = 2;

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
            //logo
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              // const Icon(Icons.message, size: 60, color: Colors.green),
              const Icon(Icons.app_registration_rounded,
                  size: 60, color: Colors.white),
              const SizedBox(height: 20),
              //Weelcoome back message

              const Text("Lets Create a Account for you  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              const SizedBox(height: 25),
              Row(
                children: [
                  Radio(
                      activeColor: Colors.blue,
                      value: "Employee",
                      fillColor: const MaterialStatePropertyAll(Colors.white),
                      groupValue: level,
                      onChanged: handleRadioValueChange),
                  const Text("Employee", style: TextStyle(color: Colors.white)),
                  Radio(
                      activeColor: Colors.blue,
                      fillColor: const MaterialStatePropertyAll(Colors.white),
                      value: "Team lead",
                      groupValue: level,
                      onChanged: handleRadioValueChange),
                  const Text("Teamlead", style: TextStyle(color: Colors.white)),
                  Radio(
                      activeColor: Colors.blue,
                      value: "Manager",
                      fillColor: const MaterialStatePropertyAll(Colors.white),
                      groupValue: level,
                      onChanged: handleRadioValueChange),
                  const Text("Manager", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 25),
              //email TextField
              MyTextField(
                //  height: double.maxFinite,
                // width: double.maxFinite,
                stylecolor: Colors.white,
                keyboardtype: TextInputType.emailAddress,
                obscureText: false,
                hintText: "Email ",
                controller: _emailcontroller,
              ),
              const SizedBox(height: 25),

              MyTextField(
                //height: double.maxFinite,
                //width: double.maxFinite,
                stylecolor: Colors.white,
                keyboardtype: TextInputType.text,
                obscureText: true,
                hintText: "Password",
                controller: _pwcontroller,
              ),
              const SizedBox(height: 25),
              MyTextField(
                //height: double.maxFinite,
                //width: double.maxFinite,
                stylecolor: Colors.white,
                keyboardtype: TextInputType.text,
                obscureText: true,
                hintText: "Confirm password",
                controller: _confirmcontroller,
              ),
              const SizedBox(height: 25),

              MyTextField(
                  //height: double.maxFinite,
                  //width: double.maxFinite,
                  stylecolor: Colors.white,
                  keyboardtype: TextInputType.text,
                  hintText: "Employee ID",
                  obscureText: false,
                  controller: _empidcontroller),

              const SizedBox(height: 25),

              MyTextField(
                  //height: double.maxFinite,
                  //width: double.maxFinite,
                  stylecolor: Colors.white,
                  keyboardtype: TextInputType.number,
                  hintText: "Sepeciality",
                  obscureText: false,
                  controller: _specialcontroller),
              const SizedBox(height: 25),

              //const SizedBox(height: 25),
              //   dvsfdv
              MyButton(
                  //height: double.maxFinite,
                  //width: double.maxFinite,
                  buttoncolor: Colors.lightBlue,
                  text: "Register",
                  onTap: () {
                    int valuetosend = jobno;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoadingPage(data: valuetosend)));
                  }),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member ?",
                      style: TextStyle(color: Color.fromARGB(255, 84, 83, 83))),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text(" Login ",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)))
                ],
              )
            ]))));
  }
}
