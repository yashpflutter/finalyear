//STilll much work to do on image picker and the data of manager to show and option to edit also
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double profileSize = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Name: somethings in couts",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Designation: somethings in couts",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "DOB: Date of Birth",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Specialization: some things in couts ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Contact Details
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Phone no.: +91 123456789"),
                  Text("Email id: xyz@gmail.com"),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ModelClass {
  String name;
  String designation;
  String dob;
  List<String> spelization;
  String email;
  String phoneno;
  ModelClass(
      {required this.name,
      required this.designation,
      required this.dob,
      required this.spelization,
      required this.email,
      required this.phoneno});
}
