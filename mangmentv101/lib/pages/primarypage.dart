import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mangmentv101/components/my_drawer.dart';
import 'package:mangmentv101/pages/employee/empnotification.dart';
import 'package:mangmentv101/pages/employee/emphome.dart';
import 'package:mangmentv101/pages/common/secondpage.dart';
import 'package:mangmentv101/pages/employee/empthirdpage.dart';
import 'package:mangmentv101/pages/common/fourthpage.dart';
import 'package:mangmentv101/pages/manager/manfirstpage.dart';
import 'package:mangmentv101/pages/manager/mannotification.dart';
import 'package:mangmentv101/pages/manager/manthirdpage.dart';
import 'package:mangmentv101/pages/teamleader/teamleadhome.dart';
import 'package:mangmentv101/pages/teamleader/teamleadnotification.dart';
import 'package:mangmentv101/pages/teamleader/teamleadthirdpage.dart';
import 'package:mangmentv101/provider/credentialprovider/loginprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageempState();
}

class _HomePageempState extends State<HomePage> {
  //int levelno = 3;
  bool tapped = false;
  Icon noticon = const Icon(Icons.notifications_outlined);

  TabBarView changethetabpage() {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    if (loginProvider.user!.designation == 3) {
      return TabBarView(
        children: [
          EmpFirstPage(),
          SecondPage(),
          Empthirdpage(),
          Empnotification(),
          FourthPage(),
        ],
      );
    } else if (loginProvider.user!.designation == 2) {
      return TabBarView(
        children: [
          TLFirstPage(),
          SecondPage(),
          TLThirdPage(),
          TLnotification(),
          FourthPage(),
        ],
      );
    } else {
      return TabBarView(children: [
        Manfirstpage(),
        SecondPage(),
        Manthirdpage(),
        Mannotification(),
        FourthPage(),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? name = Provider.of<LoginProvider>(context).user?.name;

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          appBar: AppBar(
            title: Text('Welcome  $name ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            backgroundColor: Theme.of(context).colorScheme.primary,
            bottom: TabBar(
                unselectedLabelColor:
                    Theme.of(context).colorScheme.inversePrimary,
                labelColor: Theme.of(context).colorScheme.tertiary,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.business)),
                  Tab(icon: Icon(Icons.school)),
                  Tab(icon: Icon(Icons.notifications)),
                  Tab(icon: Icon(Icons.person)),
                ]),
          ),
          drawer: MyDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Define the action here
            },
            tooltip: 'Add Item',
            elevation: 6.0, // Elevation for shadow
            backgroundColor: Theme.of(context)
                .colorScheme
                .primary, // Custom background color
            foregroundColor: Theme.of(context)
                .colorScheme
                .inversePrimary, // Custom icon color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Custom shape
            ),
            child: const Icon(Icons.chat_bubble_outline_outlined,
                color: Colors.black),
          ),
          body: changethetabpage(),
        ));
  }
}
