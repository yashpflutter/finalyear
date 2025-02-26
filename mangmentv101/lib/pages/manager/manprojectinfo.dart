// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
//import 'package:mangmentv101/provider/manprovider/manProvider.dart';
//import 'package:mangmentv101/provider/manprovider/manProvider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class projectinfo extends StatefulWidget {
  final int index;
  final String title;
  final String desc;
  final String strdate;
  final String enddate;
  final String leadid;

  projectinfo(
      {super.key,
      required this.index,
      required this.title,
      required this.desc,
      required this.strdate,
      required this.enddate,
      required this.leadid});

  @override
  State<projectinfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<projectinfo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController(); // New controller for starting date
  TextEditingController endDateController =
      TextEditingController(); // New controller for ending date
  final TextEditingController description = TextEditingController();
  TextEditingController selectTL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Project Information"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(widget.title,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
            const SizedBox(height: 20),
            Text("Descrption ",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                )),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Text(widget.desc,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    )),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            Text("Starting Date",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                )),
            const SizedBox(height: 5),
            Text(widget.strdate,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
            const SizedBox(height: 20),
            Text("Ending Date",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                )),
            const SizedBox(height: 5),
            Text(widget.enddate,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
            const SizedBox(height: 20),
            Text("Team Lead Allocation",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                )),
            Text(widget.leadid,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
  }
}
