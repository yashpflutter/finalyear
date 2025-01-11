import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mangmentv101/provider/manProvider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class projectinfo extends StatefulWidget {
  final int index;
  bool? wanttoedit;
  projectinfo({super.key, required this.index, this.wanttoedit});

  @override
  State<projectinfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<projectinfo> {
  TextEditingController titleController = TextEditingController();
  //TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController(); // New controller for starting date
  TextEditingController endDateController =
      TextEditingController(); // New controller for ending date
  final TextEditingController description = TextEditingController();
  TextEditingController selectTL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final projectProvider =
        Provider.of<projectprovider>(context, listen: false);

    return Scaffold(
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
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 5,
            ),
            Card(
                elevation: 4.0, // Adds shadow for elevated effect
                color: const Color.fromARGB(
                    255, 253, 247, 255), // Background color for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  onChanged: (value) {
                    projectProvider.setProjectName(value);
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8.0)),
                  controller: titleController,
                )),
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
                onChanged: (value) {
                  projectProvider.setDesc(value);
                },
                controller: description,
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
            const SizedBox(height: 10),
            Text("Starting Date",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                )),
            const SizedBox(height: 5),
            Card(
              elevation: 4.0, // Adds shadow for elevated effect
              color: const Color.fromARGB(
                  255, 253, 247, 255), // Background color for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: startDateController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  projectProvider.setstrDate(pickedDate);
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat.yMMMd().format(pickedDate);
                    setState(() {
                      startDateController.text = formattedDate;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Text("Ending Date",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                )),
            const SizedBox(height: 5),
            Card(
              elevation: 4.0, // Adds shadow for elevated effect
              color: const Color.fromARGB(
                  255, 253, 247, 255), // Background color for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: endDateController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat.yMMMd().format(pickedDate);
                    setState(() {
                      endDateController.text = formattedDate;
                    });
                  }
                },
              ),
            ),
            Text("Team Lead Allocation",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                )),
            Card(
                elevation: 4.0, // Adds shadow for elevated effect
                color: const Color.fromARGB(
                    255, 253, 247, 255), // Background color for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  onChanged: (value) {
                    projectProvider.setTeamlead(int.tryParse(value) ?? 101);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8.0)),
                  controller: selectTL,
                )),
            const Divider(color: Colors.black54, thickness: 3.0),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  projectProvider.addProject();
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
                      "Create",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: GestureDetector(
                onTap: () {
                  int tlid = int.tryParse(selectTL as String) ?? 101;
                  projectProvider.updateProject(
                      widget.index!,
                      titleController.text,
                      startDateController.text,
                      endDateController.text,
                      description.text,
                      tlid);
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
                      "Update ",
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

class ProjectModelclass {
  String name;
  String desc;
  String strdate;
  String enddate;
  int teamleadid;
  ProjectModelclass(
    this.name,
    this.desc,
    this.strdate,
    this.enddate,
    this.teamleadid,
  );
}
