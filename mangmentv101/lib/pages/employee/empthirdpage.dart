import 'package:flutter/material.dart';

class Empthirdpage extends StatelessWidget {
  const Empthirdpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${index + 1} in List 1'),
                );
              },
            ),
          ),
          Divider(), // To separate the two lists
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${index + 1} in List 2'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
