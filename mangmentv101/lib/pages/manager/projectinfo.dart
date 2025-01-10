import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class projectinfo extends StatefulWidget {
  final String heading; // Use String instead of Text
  final String strdate;
  final String enddate;

  // ignore: use_super_parameters
  const projectinfo({
    Key? key,
    required this.heading,
    required this.strdate,
    required this.enddate,
  }) : super(key: key);

  @override
  State<projectinfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<projectinfo> {
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Project Information")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.heading, // Directly use heading as a string
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _description,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text("Starting Date: ${widget.strdate}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),
            Text("Ending Date: ${widget.enddate}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 20),
            Text(
              "Team Lead Allocation",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(color: Colors.black54, thickness: 3.0),
            Text(
              "Employees",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                itemCount: 5, // Replace with actual list length
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee Name", // Replace with actual employee name
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Update action
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Center(
                    child: Text(
                      "UPDATE",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
