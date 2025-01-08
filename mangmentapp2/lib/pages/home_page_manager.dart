import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_handling_app/components/my_drawer.dart';
import 'package:project_handling_app/pages/common/notificationmain.dart';
import 'package:project_handling_app/pages/manager/firstpage.dart';
import 'package:project_handling_app/pages/common/secondpage.dart';
import 'package:project_handling_app/pages/manager/thirdpage.dart';
import 'package:project_handling_app/pages/common/fourthpage.dart';

class HomePagemanager extends StatefulWidget {
  const HomePagemanager({super.key});

  @override
  State<HomePagemanager> createState() => _HomePagemanagerState();
}

class _HomePagemanagerState extends State<HomePagemanager> {
  int levelno = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
              title: const Text(
                "Manager Name ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.today_outlined)),
                Tab(icon: Icon(Icons.school)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.settings)),
              ])),
          drawer: MyDrawer(pageno: levelno), // Persistent Drawer

          /*   floatingActionButton: FloatingActionButton(
            onPressed: (){
        Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {  }),
        
    );
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
          ),*/

          //

          // Dynamic body content based on the selected page index
          body: TabBarView(children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
            notification(),
            FourthPage(),
          ]), // Switches body content
        ));
  }
}
