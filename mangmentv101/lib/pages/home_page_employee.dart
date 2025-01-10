import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mangmentv101/components/my_drawer.dart';
import 'package:mangmentv101/pages/common/notificationmain.dart';
import 'package:mangmentv101/pages/employee/home.dart';
import 'package:mangmentv101/pages/common/secondpage.dart';
import 'package:mangmentv101/pages/employee/thirdpage.dart';
import 'package:mangmentv101/pages/common/fourthpage.dart';

class HomePageemp extends StatefulWidget {
  const HomePageemp({super.key});

  @override
  State<HomePageemp> createState() => _HomePageempState();
}

class _HomePageempState extends State<HomePageemp> {
  int levelno = 3;
  bool tapped = false;
  Icon noticon = const Icon(Icons.notifications_outlined);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white54,
          appBar: AppBar(
            title: const Text('Employee Name ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            backgroundColor: Colors.transparent,
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.business)),
              Tab(icon: Icon(Icons.school)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.settings)),
            ]),
          ),
          drawer: MyDrawer(pageno: levelno),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Define the action here
            },
            tooltip: 'Add Item',
            elevation: 6.0, // Elevation for shadow
            backgroundColor: Colors.grey, // Custom background color
            foregroundColor: Colors.white, // Custom icon color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Custom shape
            ),
            child: const Icon(Icons.chat_bubble_outline_outlined,
                color: Colors.black),
          ),
          body: TabBarView(
            children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
              notification(),
              FourthPage(),
            ],
          ),
        ));
  }
}
