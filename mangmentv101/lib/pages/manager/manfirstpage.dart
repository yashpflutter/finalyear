import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mangmentv101/pages/manager/manprojectinfo.dart';
//import 'package:mangmentv101/provider/manprovider/manProvider.dart';
import 'package:intl/intl.dart';
//import 'package:provider/provider.dart';

class Manfirstpage extends StatefulWidget {
  const Manfirstpage({super.key});
  @override
  State createState() => _FirstPageState();
}

class _FirstPageState extends State<Manfirstpage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController TLid = TextEditingController();

  void submit(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    //toDoMOdelobbj is null
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        startDateController.text.trim().isNotEmpty &&
        endDateController.text.trim().isNotEmpty &&
        TLid.text.trim().isNotEmpty) {
      if (!doEdit) {
        setState(() {
          cardList.add(ToDoModelClass(
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            enddate: endDateController.text.trim(),
            strdate: startDateController.text.trim(),
            tlid: TLid.text.trim(),
          ));
        });
      } else {
        setState(() {
          toDoModelObj!.title = titleController.text.trim();
          toDoModelObj.description = descriptionController.text.trim();
          toDoModelObj.strdate = startDateController.text.trim();
          toDoModelObj.enddate = endDateController.text.trim();
          toDoModelObj.tlid = TLid.text.trim();
        });
      }
    }
    clearController();
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
    TLid.clear();
  }

  bool editcreate = false;
  String sheettitle() {
    if (editcreate == false) {
      return "Create Task";
    } else {
      editcreate = false;
      return "Edit Task";
    }
  }

  void editCard(ToDoModelClass todoModelobj) {
    titleController.text = todoModelobj.title;
    descriptionController.text = todoModelobj.description;
    startDateController.text = todoModelobj.strdate;
    endDateController.text = todoModelobj.enddate;
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        isScrollControlled: true, //modal sheet bottom must go up when typng
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                //padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  ///when the sheet goes up it shows minmum
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      //"Create Task",
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
                              //use google fonts
                              //style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        const Text("Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: descriptionController,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.black54),
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text("Start Date",
                            style: GoogleFonts.quicksand(
                              //use google fonts
                              //style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: startDateController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                          readOnly: true,
                          onTap: () async {
                            //pick the date from datepicker
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                              //Formates the date into the Required
                              //Format of date i.e Year month Date
                            );
                            String formatedDate =
                                DateFormat.yMMMd().format(pickedDate!);
                            setState(() {
                              startDateController.text = formatedDate;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("End Date",
                            style: GoogleFonts.quicksand(
                              //use google fonts
                              //style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: endDateController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                          readOnly: true,
                          onTap: () async {
                            //pick the date from datepicker
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                              //Formates the date into the Required
                              //Format of date i.e Year month Date
                            );
                            String formatedDate =
                                DateFormat.yMMMd().format(pickedDate!);
                            setState(() {
                              endDateController.text = formatedDate;
                            });
                          },
                        ),
                        Text("Team Lead Id",
                            style: GoogleFonts.quicksand(
                              //use google fonts
                              //style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          controller: TLid,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!doEdit) {
                          //!doEdit it is defalu false it will become true and send bu submit function
                          //to add task only doedit will be Send
                          submit(doEdit);
                        } else {
                          //For editng task obj and doEdit will be send
                          submit(doEdit, toDoModelObj);
                        }

                        Navigator.of(context).pop();
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(120, 120, 120, 1))),
                      child: const Text("Submit",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )),
          );
        });
  }

  double calculateProgress(String startDate, String endDate) {
    // Ensure the date format matches the format in the input strings
    DateFormat dateFormat =
        DateFormat("MMM dd, yyyy"); // Adjust based on your format
    DateTime start = dateFormat.parse(startDate);
    DateTime end = dateFormat.parse(endDate);
    DateTime now = DateTime.now();

    // Check if the current date is before the start date or after the end date
    if (now.isBefore(start)) return 0.0;
    if (now.isAfter(end)) return 1.0;

    // Calculate the progress as a fraction of the days passed between start and end
    double progress =
        (now.difference(start).inDays / end.difference(start).inDays)
            .clamp(0.0, 1.0);
    return progress;
  }

  List<ToDoModelClass> cardList = [];

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.20;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(children: [
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
                    clearController();
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
                      itemBuilder: (BuildContext context, int index) {
                        double progress = calculateProgress(
                          cardList[index].strdate,
                          cardList[index].enddate,
                        );
                        return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Card(
                              elevation: 4.0, // Adds shadow for elevated effect
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary, // Background color for the card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: cardHeight,
                                padding: const EdgeInsets.all(15.0),
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
                                            cardList[index].strdate,
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
                                                child: Icon(
                                                    Icons.pie_chart_sharp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          projectinfo(
                                                        index: index,
                                                        title: cardList[index]
                                                            .title,
                                                        desc: cardList[index]
                                                            .description,
                                                        strdate: cardList[index]
                                                            .strdate,
                                                        enddate: cardList[index]
                                                            .enddate,
                                                        leadid: cardList[index]
                                                            .tlid,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              const SizedBox(width: 12),
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  size: 25,
                                                ),
                                                onTap: () {
                                                  editCard(cardList[index]);
                                                },
                                              ),
                                              const SizedBox(width: 12),
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  size: 25,
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
                                            cardList[index].enddate,
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
                                        'Time remaing ',
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
                                            AlwaysStoppedAnimation<Color>(
                                          Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ));
                      })))
        ]));
  }
}

//this make to send all the things compusory if not given it will show error
class ToDoModelClass {
  String title;
  String description;
  String strdate;
  String enddate;
  String tlid;
  ToDoModelClass(
      {required this.title,
      required this.description,
      required this.strdate,
      required this.enddate,
      required this.tlid});
}
