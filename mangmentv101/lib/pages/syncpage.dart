import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mangmentv101/pages/home_page_employee.dart';
import 'package:mangmentv101/pages/home_page_manager.dart';
import 'package:mangmentv101/pages/home_page_teamlead.dart';

class LoadingPage extends StatefulWidget {
  final int data;
  const LoadingPage({super.key, required this.data});

  @override
  State<LoadingPage> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // Start the timer when the page is initialized
    Timer(Duration(seconds: 1), () {
      if (widget.data == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomePagemanager()), // Navigate to the HomePage
        );
      } else if (widget.data == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomePageteamlead()), // Navigate to the HomePage
        );
      } else if (widget.data == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomePageemp()), // Navigate to the HomePage
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.primary, // Set background to black
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white), // White spinner
                ),

                // Add an animated loader, for instance, a spinning icon or a custom animation

                SizedBox(height: 20),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors
                        .white, // White text for better visibility on black background
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                      // ignore: deprecated_member_use
                      .withOpacity(0.8), // Semi-transparent background
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                // Add the Google API for Firebase
                child: const Text(
                  'Syncing your Google account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Text color on a white container
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//use when need to add vpn security
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';
import 'package:mangmentv101/pages/home_page_employee.dart';
import 'package:mangmentv101/pages/home_page_manager.dart';
import 'package:mangmentv101/pages/home_page_teamlead.dart';

class LoadingPage extends StatefulWidget {
  final int data;
  const LoadingPage({super.key, required this.data});

  @override
  State<LoadingPage> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  bool _isVpnConnected = false;

  @override
  void initState() {
    super.initState();
    _checkVpnStatus();
  }

  void _checkVpnStatus() async {
    while (!_isVpnConnected) {
      bool vpnStatus =
          await VpnConnectionDetector.isVpnActive(); // Check VPN status
      setState(() {
        _isVpnConnected = vpnStatus;
      });

      if (vpnStatus) {
        // Navigate to the appropriate page based on `widget.data`
        if (widget.data == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePagemanager()),
          );
        } else if (widget.data == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePageteamlead()),
          );
        } else if (widget.data == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePageemp()),
          );
        }
        break;
      }

      // Wait for 1 second before checking again
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Checking VPN connection...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  _isVpnConnected
                      ? 'VPN is active. Syncing your account...'
                      : 'Please turn on VPN to proceed.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
