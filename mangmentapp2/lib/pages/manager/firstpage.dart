//make changes in the tile of the projects make it look like in the progress section
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_handling_app/pages/manager/projectinfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Don't forget this import for DateFormat

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController titleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController(); // New controller for starting date
  TextEditingController endDateController =
      TextEditingController(); // New controller for ending date
  bool editcreate = false;
  List<ToDoModelClass> cardList = [];

  void submit(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    if (titleController.text.trim().isNotEmpty &&
        // descriptionController.text.trim().isNotEmpty &&
        startDateController.text.trim().isNotEmpty &&
        endDateController.text.trim().isNotEmpty) {
      setState(() {
        if (!doEdit) {
          cardList.add(ToDoModelClass(
              title: titleController.text.trim(),
              // description: descriptionController.text.trim(),
              startDate: startDateController.text.trim(),
              endDate: endDateController.text.trim()));
        } else {
          toDoModelObj!.title = titleController.text.trim();
          //  toDoModelObj.description = descriptionController.text.trim();
          toDoModelObj.startDate = startDateController.text.trim();
          toDoModelObj.endDate = endDateController.text.trim();
        }
      });
    }
    clearController();
  }

  void clearController() {
    titleController.clear();
    //  descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  String sheettitle() {
    if (editcreate == false) {
      return "Create Project";
    } else {
      editcreate = false;
      return "Edit Project";
    }
  }

  void editCard(ToDoModelClass todoModelobj) {
    titleController.text = todoModelobj.title;
    //  descriptionController.text = todoModelobj.description;
    startDateController.text = todoModelobj.startDate;
    endDateController.text = todoModelobj.endDate;
    editcreate = true;
    showBottomSheet(true, todoModelobj);
  }

  void deleteCard(ToDoModelClass toDoModelobj) {
    setState(() {
      cardList.remove(toDoModelobj);
    });
  }

  void showBottomSheet(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.top,
                    right: MediaQuery.of(context).viewInsets.right * 1.5,
                    left: 5.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        sheettitle(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
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
                              color: const Color.fromARGB(255, 253, 247,
                                  255), // Background color for the card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0)),
                                controller: titleController,
                              )),

                          /* const Text("Description",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              )),*/
                          const SizedBox(
                            height: 5,
                          ),
                          // chnage the strating dat and endng date textfield
                          /*    TextField(
                              controller: descriptionController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),*/
                          const SizedBox(height: 10),
                          Text("Starting Date",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              )),
                          const SizedBox(height: 5),

                          Card(
                            elevation: 4.0, // Adds shadow for elevated effect
                            color: const Color.fromARGB(255, 253, 247,
                                255), // Background color for the card
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
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2025),
                                );
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
                            color: const Color.fromARGB(255, 253, 247,
                                255), // Background color for the card
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
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2025),
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
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (!doEdit) {
                            submit(doEdit);
                          } else {
                            submit(doEdit, toDoModelObj);
                          }
                          Navigator.of(context).pop();
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 131, 131, 131))),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )));
        });
  }

  double calculateProgress(String startDate, String endDate) {
    DateTime start = DateFormat.yMMMd().parse(startDate);
    DateTime end = DateFormat.yMMMd().parse(endDate);
    DateTime now = DateTime.now();
    if (now.isBefore(start)) return 0.0;
    if (now.isAfter(end)) return 1.0;
    return (now.difference(start).inDays / end.difference(start).inDays)
        .clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.20;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
              child: Row(
                children: [
                  const SizedBox(
                    height: 24,
                    width: 20,
                  ),
                  const Text(
                    'Create Projects ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 243, 235, 249),
                    onPressed: () {
                      showBottomSheet(false);
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    height: 24,
                    width: 20,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Expanded(
                child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (context, index) {
                    double progress = calculateProgress(
                      cardList[index].startDate,
                      cardList[index].endDate,
                    );
                    return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Card(
                          elevation: 4.0, // Adds shadow for elevated effect
                          color: const Color.fromARGB(255, 253, 247,
                              255), // Background color for the card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: cardHeight,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                //const Spacer(),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        cardList[index].title,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        maxLines: 1, // Limit to one line
                                        overflow: TextOverflow
                                            .ellipsis, // Show ellipsis for overflow
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 4.0,
                                    right: 6.0,
                                    left: 6.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Starting Date :',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        cardList[index].startDate,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.pie_chart_sharp,
                                              color:
                                                  Color.fromRGBO(2, 16, 177, 1),
                                              size: 20,
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      projectinfo(
                                                    enddate:
                                                        cardList[index].endDate,
                                                    strdate: cardList[index]
                                                        .startDate,
                                                    heading:
                                                        cardList[index].title,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 12),
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.edit,
                                              color:
                                                  Color.fromRGBO(2, 16, 177, 1),
                                              size: 20,
                                            ),
                                            onTap: () {
                                              editCard(cardList[index]);
                                            },
                                          ),
                                          const SizedBox(width: 12),
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.delete,
                                              color:
                                                  Color.fromRGBO(2, 16, 177, 1),
                                              size: 20,
                                            ),
                                            onTap: () {
                                              deleteCard(cardList[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 8.0,
                                    right: 6.0,
                                    left: 6.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Ending Date :',
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        cardList[index].endDate,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 0.0,
                                    right: 6.0,
                                    left: 6.0,
                                  ),
                                  child: Text(
                                    'Progress ',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                    bottom: 6.0,
                                    top: 6.0,
                                  ),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Colors.blue,
                                    ),
                                  ),
                                ),
                                // const Spacer(),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

class ToDoModelClass {
  String title;
  // String description;
  String startDate;
  String endDate;

  ToDoModelClass({
    required this.title,
    // required this.description,
    required this.startDate,
    required this.endDate,
  });
}
