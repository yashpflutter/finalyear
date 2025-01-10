import 'package:flutter/material.dart';
import 'package:mangmentv101/components/my_drawer.dart';
import 'package:mangmentv101/pages/common/notificationmain.dart';
import 'package:mangmentv101/pages/teamleader/home.dart';
import 'package:mangmentv101/pages/common/fourthpage.dart';
import 'package:mangmentv101/pages/common/secondpage.dart';
import 'package:mangmentv101/pages/teamleader/thirdpage.dart';

class HomePageteamlead extends StatefulWidget {
  const HomePageteamlead({super.key});

  @override
  State<HomePageteamlead> createState() => _HomePageteamleadState();
}

class _HomePageteamleadState extends State<HomePageteamlead> {
  int levelno = 2; // Level number, can be modified if needed

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text(
              "Team Lead",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey, // Transparent AppBar
            elevation: 0, // Remove shadow
            bottom: const TabBar(
              indicatorColor: Colors.black, // Tab indicator color
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.business)),
                Tab(icon: Icon(Icons.school)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          drawer: MyDrawer(pageno: levelno), // Persistent Drawer

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Define the action here
            },
            tooltip: 'Add Item',
            elevation: 0, // Remove shadow for transparency
            backgroundColor:
                // ignore: deprecated_member_use
                Colors.grey.withOpacity(0.7), // Semi-transparent background
            foregroundColor: Colors.white, // Custom icon color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Custom shape
            ),
            child: const Icon(Icons.chat_bubble_outline_outlined,
                color: Colors.black),
          ),

          // TabBarView for dynamic content based on selected tab
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TabBarView(
              children: [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
                notification(),
                FourthPage(),
              ],
            ),
          )),
    );
  }
}
