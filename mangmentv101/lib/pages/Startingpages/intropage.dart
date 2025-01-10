import 'package:flutter/material.dart';

import 'package:mangmentv101/pages/login_page.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              OnboardingPage(
                widgets: Container(),
                color: Colors.blue,
                title: "Welcome",
                description: "Discover amazing features in our app.",
              ),
              OnboardingPage(
                widgets: Container(),
                color: Colors.green,
                title: "Stay Connected",
                description: "Stay in touch with your loved ones.",
              ),
              OnboardingPage(
                widgets: Center(
                    child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: const Text(">"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        })),
                color: Colors.orange,
                title: "Get Started",
                description: "Let’s dive in and explore the app.",
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.black,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final Widget widgets;
  const OnboardingPage(
      {super.key,
      required this.color,
      required this.title,
      required this.description,
      required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(child: widgets),
          ],
        ),
      ),
    );
  }
}
