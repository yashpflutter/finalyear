//import 'package:project_handling_app/pages/chatapp/home_page.dart';
//import 'package:project_handling_app/pages/chatapp/settingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:chatapp/services/auth/auth_serice.dart';
import 'package:project_handling_app/pages/home_page_employee.dart';
import 'package:project_handling_app/pages/home_page_manager.dart';
import 'package:project_handling_app/pages/home_page_teamlead.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  final int pageno;
  MyDrawer({super.key, required this.pageno});

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
        backgroundColor: Color.fromRGBO(222, 223, 225, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/splash.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit
                          .cover, // Adjusts the image to fit within the circle
                    ),
                  ),
                  /*Image.asset(
                      'assets/splash.jpg',
                    )*/
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    hoverColor: Colors.white54,
                    tileColor: Colors.white,
                    title: const Text("HOME",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    leading: const Icon(Icons.home,
                        color: Color.fromARGB(255, 56, 55, 55)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pagetosend()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    hoverColor: Colors.white54,
                    tileColor: Colors.white,
                    title: const Text("SETTING ",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    leading: const Icon(Icons.settings,
                        color: Color.fromARGB(255, 56, 55, 55)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pagetosend()));
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                hoverColor: Colors.white54,
                tileColor: Colors.white,
                title: const Text("LOGOUT",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.red)),
                leading: const Icon(Icons.logout,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  // final auth = AuthService();
                  //auth.signOut();
                },
              ),
            ),
          ],
        ));
  }
}
