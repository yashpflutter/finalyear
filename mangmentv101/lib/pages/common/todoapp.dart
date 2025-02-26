// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: duplicate_ignore
// ignore: camel_case_types
class todoapp extends StatefulWidget {
  final DateTime selectedDay;
  const todoapp({super.key, required this.selectedDay});

  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  bool editCreate = false;

  List<ToDoModelClass> cardList = [];

  List<ToDoModelClass> doneList = [];

  void submit(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    if (titleController.text.trim().isNotEmpty &&
        startTimeController.text.trim().isNotEmpty &&
        endTimeController.text.trim().isNotEmpty) {
      setState(() {
        if (!doEdit) {
          cardList.add(ToDoModelClass(
              title: titleController.text.trim(),
              startTime: startTimeController.text.trim(),
              endTime: endTimeController.text.trim()));
        } else {
          toDoModelObj!.title = titleController.text.trim();
          toDoModelObj.startTime = startTimeController.text.trim();
          toDoModelObj.endTime = endTimeController.text.trim();
        }
      });
    }
    clearController();
  }

  void clearController() {
    titleController.clear();
    startTimeController.clear();
    endTimeController.clear();
  }

  String sheetTitle() {
    if (editCreate == false) {
      return "Create Project";
    } else {
      editCreate = false;
      return "Edit Project";
    }
  }

  void editCard(ToDoModelClass todoModelObj) {
    titleController.text = todoModelObj.title;
    startTimeController.text = todoModelObj.startTime;
    endTimeController.text = todoModelObj.endTime;
    editCreate = true;
    showBottomSheet(true, todoModelObj);
  }

  void deleteCard(ToDoModelClass toDoModelObj) {
    setState(() {
      cardList.remove(toDoModelObj);
    });
  }

  //chcekbox
  bool valueofboxpending = false;
  bool valueofboxdone = true;
  void changethecard(bool valueofbox, ToDoModelClass toDoModelClass) {
    if (valueofbox == true) {
      doneList.add(ToDoModelClass(
          title: toDoModelClass.title.trim(),
          startTime: toDoModelClass.startTime.trim(),
          endTime: toDoModelClass.endTime.trim()));
      cardList.remove(toDoModelClass);
    } else if (valueofbox == false) {
      cardList.add(ToDoModelClass(
          title: toDoModelClass.title.trim(),
          startTime: toDoModelClass.startTime.trim(),
          endTime: toDoModelClass.endTime.trim()));
      doneList.remove(toDoModelClass);
    }
  }

  void deleteCarddone(ToDoModelClass toDoModelObj) {
    setState(() {
      doneList.remove(toDoModelObj);
    });
  }

//checkbox
//bottomsheet
  void showBottomSheet(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );

    final textStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
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
                  sheetTitle(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title", style: textStyle),
                    const SizedBox(height: 5),
                    TextField(
                      controller: titleController,
                      decoration: textFieldDecoration,
                    ),
                    const SizedBox(height: 10),
                    Text("Starting Time", style: textStyle),
                    const SizedBox(height: 5),
                    TextField(
                      controller: startTimeController,
                      decoration: textFieldDecoration.copyWith(
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          String formattedTime = pickedTime.format(context);
                          setState(() {
                            startTimeController.text = formattedTime;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Text("Ending Time", style: textStyle),
                    const SizedBox(height: 5),
                    TextField(
                      controller: endTimeController,
                      decoration: textFieldDecoration.copyWith(
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          String formattedTime = pickedTime.format(context);
                          setState(() {
                            endTimeController.text = formattedTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    submit(doEdit, toDoModelObj);
                    Navigator.of(context).pop();
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//bottomsheet
//progress calculaator
  double calculateProgress(String startTime, String endTime) {
    DateFormat formatter = DateFormat.jm(); // Format for time (hh:mm AM/PM)

    try {
      DateTime start = formatter.parse(startTime);
      DateTime end = formatter.parse(endTime);
      DateTime now = DateTime.now();

      // Normalize the current time to today's date to compare with start and end times
      now = DateTime(now.year, now.month, now.day, now.hour, now.minute);

      if (now.isBefore(start)) return 0.0;
      if (now.isAfter(end)) return 1.0;

      return (now.difference(start).inMinutes / end.difference(start).inMinutes)
          .clamp(0.0, 1.0);
    } catch (e) {
      // print("Error parsing time: $e");
      return 0.0; // Default to 0 progress if there's a format issue
    }
  }

//progress calclator
  @override
  Widget build(BuildContext context) {
    DateTime somesome = widget.selectedDay;
    String formattedDate = DateFormat('yyyy-MM-dd').format(somesome);
    return Scaffold(
        appBar: AppBar(
          title: Text(formattedDate),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.surface),

            onPressed: () {
              Navigator.pop(context, cardList); // Return to the previous page
            },
            color: Colors.white, // Icon color
            iconSize: 28.0, // Icon size
            padding: const EdgeInsets.all(12), // Padding around the icon
            tooltip: "Go Back", // Tooltip on long press
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet(false);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const Text("TO DO Tasks",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(border: Border.all()),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 120,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Card(
                            elevation: 4.0, // Adds shadow for elevated effect
                            color: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                children: [
                                  const Spacer(),
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
                                  Row(children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 4.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Time Left",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 4.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${cardList[index].startTime} - ${cardList[index].endTime}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const Spacer(),
                                  const LinearProgressIndicator(
                                    value: 0.5,
                                    color: Colors.green,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Checkbox(
                                        value: false,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            valueofboxpending = value!;
                                            changethecard(valueofboxpending,
                                                cardList[index]);
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          editCard(cardList[index]);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          deleteCard(cardList[index]);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )));
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text("Done"),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                itemCount: doneList.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 120,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Card(
                            elevation: 4.0, // Adds shadow for elevated effect
                            color: Theme.of(context)
                                .colorScheme
                                .surface, // Background color for the card
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          //     doneList[index].title,
                                          doneList[index].title,
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          maxLines: 1, // Limit to one line
                                          overflow: TextOverflow
                                              .ellipsis, // Show ellipsis for overflow
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 4.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Time Left",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 4.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${doneList[index].startTime} - ${doneList[index].endTime}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  const Spacer(),
                                  const LinearProgressIndicator(
                                    value: 1.0,
                                    color: Colors.green,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Checkbox(
                                        value: true,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            valueofboxdone = value!;
                                            changethecard(valueofboxdone,
                                                doneList[index]);
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          deleteCarddone(doneList[index]);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ));
                },
              ),
            )
          ],
        ));
  }
}

class ToDoModelClass {
  String title;
  String startTime;
  String endTime;
  ToDoModelClass({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
