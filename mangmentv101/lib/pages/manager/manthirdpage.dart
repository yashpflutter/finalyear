//there are some flause and progress page and deatil apge for submited data must be made it will be made after firebase and sqlite and file upload
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Manthirdpage extends StatefulWidget {
  const Manthirdpage({super.key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<Manthirdpage> {
  // Sample data for ongoing and completed projects
  final List<String> ongoingProjects = [
    'Project ABC',
    'Project DEF',
    'Project GHI'
  ];
  final List<String> completedProjects = [
    'Completed Project XYZ',
    'Completed Project LMN'
  ];

  void navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProgressDetailsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight =
        MediaQuery.of(context).size.height * 0.15; // Adjust height as needed

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ongoing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: ongoingProjects.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: navigateToDetails,
                    child: Card(
                      child: Container(
                        height: cardHeight,
                        padding: const EdgeInsets.all(16.0),
                        child: Text(ongoingProjects[
                            index]), // Use the ongoing project name
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Completed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: completedProjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: cardHeight,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(completedProjects[
                          index]), // Use the completed project name
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressDetailsPage extends StatefulWidget {
  const ProgressDetailsPage({super.key});

  @override
  _ProgressDetailsPageState createState() => _ProgressDetailsPageState();
}

class _ProgressDetailsPageState extends State<ProgressDetailsPage> {
  double progressValue = 0.25; // Example progress value (25%)

  void navigateToProjectWorkDone() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProjectWorkDone()),
    );
  }
  //

  @override
  Widget build(BuildContext context) {
    // final double progressSize = MediaQuery.of(context).size.width *
    0.5; // Size of the progress indicator
    final double buttonHeight = MediaQuery.of(context).size.height *
        0.06; // Button height based on screen size

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Container(
              color: Colors.white,
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: progressValue, // Progress value (25%)
                strokeWidth: 30,
                backgroundColor: Colors.grey,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "${(progressValue * 100).toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 24), // Increased font size
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                color: Colors.grey[300],
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Project ABC",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20)), // Increased font size
                    SizedBox(height: 10),
                    Text("Description of the project.",
                        style: TextStyle(fontSize: 16)), // Increased font size
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Row(children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                color: Colors.grey[300],
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Project ABC",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20)), // Increased font size
                    SizedBox(height: 10),
                    Text("Description of the project.",
                        style: TextStyle(fontSize: 16)), // Increased font size
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 20),
            SizedBox(
              height: buttonHeight,
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust button width
              child: ElevatedButton(
                onPressed: navigateToProjectWorkDone,
                child: const Text("Check Work"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Example ProjectWorkDone page
class ProjectWorkDone extends StatelessWidget {
  const ProjectWorkDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Work'),
      ),
      body: Center(
        child: const Text('All completed projects will be displayed here.'),
      ),
    );
  }
}
