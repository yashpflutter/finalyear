//There is lot to do in the todo app and the daily secdular below the calander it must show present and seculed after todays
//also work on todo app
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_handling_app/pages/common/todoapp.dart';
import 'package:table_calendar/table_calendar.dart'; // Don't forget this import for DateFormat

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<SecondPage> {
  Map<DateTime, List<String>> events = {
    DateTime(2024, 10, 1): ['Event 1', 'Event 2'],
    DateTime(2024, 10, 5): ['Event 3'],
    DateTime(2024, 10, 10): ['Event 4', 'Event 5', 'Event 6'],
  };
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<ToDoModelClass> returnedDate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Column(
          children: [
            GestureDetector(
              onDoubleTap: () async {
                if (_selectedDay == _focusedDay) {
                  {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => todoapp(
                                  selectedDay: _focusedDay,
                                )));
                    if (result != null) {
                      setState(() {
                        returnedDate = result; // Update UI with returned data
                      });
                    }
                  }
                }
              },
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(3000, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: Colors.black),
                  weekendTextStyle: TextStyle(color: Colors.red),
                ),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                ),
              ),
            ),
            SizedBox(
                height: 300, // Set a fixed height for the ListView
                child: ListView.builder(
                  itemCount: events[_selectedDay]?.length ?? 0,
                  itemBuilder: (context, index) {
                    String eventName = events[_selectedDay]![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(eventName),
                        subtitle: Text(
                            'Date: ${DateFormat('dd/MM/yyyy').format(_selectedDay!)}'),
                      ),
                    );
                  },
                )),
          ],
        )));
  }
}
