import 'package:flutter/material.dart';
import 'package:mangmentv101/components/my_settingpage.dart';

import 'package:mangmentv101/pages/home_page_employee.dart';
import 'package:mangmentv101/pages/home_page_manager.dart';
import 'package:mangmentv101/pages/home_page_teamlead.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  final int pageno;
  const MyDrawer({super.key, required this.pageno});

  @override
  Widget build(BuildContext context) {
    Widget pagetosend() {
      if (pageno == 1) {
        return HomePagemanager();
      } else if (pageno == 2) {
        return HomePageteamlead();
      } else {
        return HomePageemp();
      }
    }

    return Drawer(
        backgroundColor: Colors.transparent,
        //Color.fromRGBO(222, 223, 225, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 25),
                ClipOval(
                  child: Image.asset(
                    'assets/splash.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit
                        .cover, // Adjusts the image to fit within the circle
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 5.0)],
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                        ),
                        SizedBox(width: 5.0),
                        Text("HOME ",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pagetosend()));
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 5.0)],
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(width: 5.0),
                        Text("Setting ",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 5.0)],
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.logout,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    SizedBox(width: 5.0),
                    Text("LOGOUT ",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
