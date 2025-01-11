//STilll much work to do on image picker and the data of manager to show and option to edit also
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:mangmentv101/components/my_textfield.dart';
import 'package:mangmentv101/provider/credentialprovider/loginprovider.dart';
import 'package:mangmentv101/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  static const textFieldDecoration = InputDecoration(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  );

  final textStyle = GoogleFonts.quicksand(
    fontWeight: FontWeight.w700,
    fontSize: 15,
  );
  String _getDesignation(int? designation) {
    if (designation == null) {
      return 'Error: 101'; // Handle null case
    }

    switch (designation) {
      case 1:
        return 'Manager';
      case 2:
        return 'Team Lead';
      case 3:
        return 'Employee';
      default:
        return 'Unknown'; // Handle unexpected values
    }
  }

  @override
  Widget build(BuildContext context) {
    double profileSize = MediaQuery.of(context).size.width * 0.3;
    LoginProvider loginprovider = Provider.of<LoginProvider>(context);

    TextEditingController controller = TextEditingController();
    return Scaffold(
      body:
          //Consumer<LoginProvider>(
          //builder: (context, loginProvider, child) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Profile image and title
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage, // Tap to select an image
                  child: CircleAvatar(
                    radius: profileSize / 2,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!) as ImageProvider
                        : const AssetImage('assets/default_profile.png'),
                    child: _profileImage == null
                        ? Icon(
                            Icons.camera_alt,
                            size: profileSize / 3,
                            color: Colors.white70,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Profile Details
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Name: ${loginprovider.user!.name}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Email id: ${loginprovider.user!.email}",
                    style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Designation: ${loginprovider.user != null ? _getDesignation(loginprovider.user!.designation) : 'Error: 101'}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Employee ID : ${loginprovider.user!.empid}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Password : ${loginprovider.user!.password}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      builder: (BuildContext) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Update password",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Password", style: textStyle),
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: controller,
                                      decoration: textFieldDecoration,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .setUserregter(User(
                                            email: loginprovider.user!.email,
                                            password: controller.text,
                                            name: loginprovider.user!.name,
                                            designation:
                                                loginprovider.user!.designation,
                                            empid: loginprovider.user!.empid));
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 22,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                    padding: const EdgeInsets.all(5),
                    // margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Text("Change password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary))),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
