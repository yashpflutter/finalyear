//make changes in the tile of the projects make it look like in the progress section
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mangmentv101/pages/manager/manprojectinfo.dart';
//import 'package:project_handling_app/pages/manager/projectinfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mangmentv101/provider/manProvider.dart';
import 'package:provider/provider.dart'; // Don't forget this import for DateFormat

class ManFirstPage extends StatefulWidget {
  @override
  _ManFirstPageState createState() => _ManFirstPageState();
}

class _ManFirstPageState extends State<ManFirstPage> {
  TextEditingController titleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController(); // New controller for starting date
  TextEditingController endDateController =
      TextEditingController(); // New controller for ending date
  bool editcreate = false;
  int count = 0;

  // double calculateProgress(String startDate, String endDate) {
  //   DateTime start = DateFormat.yMMMd().parse(startDate);
  //   DateTime end = DateFormat.yMMMd().parse(endDate);
  //   DateTime now = DateTime.now();
  //   if (now.isBefore(start)) return 0.0;
  //   if (now.isAfter(end)) return 1.0;
  //   return (now.difference(start).inDays / end.difference(start).inDays)
  //       .clamp(0.0, 1.0);
  // }

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<projectprovider>(context);
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => projectinfo(
                      //         index: projectProvider.projectlist.length),
                      //   ),
                      // );
                    },
                    child: Icon(Icons.add, color: Colors.black),
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
                  itemCount: projectProvider.projectlist.length,
                  itemBuilder: (context, index) {
                    // double progress = calculateProgress(
                    //   projectProvider.projectlist[index].strdate,
                    //   projectProvider.projectlist[index].enddate,
                    // );
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
                                        projectProvider.projectlist[index].name,
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
                                        projectProvider
                                            .projectlist[index].strdate,
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
                                                  builder: (context) => projectinfo(
                                                      index: index
                                                      // enddate:
                                                      //     cardList[index].endDate,
                                                      // strdate: cardList[index]
                                                      //     .startDate,
                                                      // heading:
                                                      //     cardList[index].title,
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      projectinfo(index: index),
                                                ),
                                              );
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
                                              projectProvider.deleteTask(index);
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
                                        projectProvider
                                            .projectlist[index].enddate,
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
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //     right: 20,
                                //     left: 20,
                                //     bottom: 6.0,
                                //     top: 6.0,
                                //   ),
                                //   child: LinearProgressIndicator(
                                //     value: progress,
                                //     backgroundColor: Colors.grey[300],
                                //     valueColor:
                                //         const AlwaysStoppedAnimation<Color>(
                                //       Colors.blue,
                                //     ),
                                //   ),
                                // ),
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
