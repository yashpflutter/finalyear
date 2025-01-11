import 'package:flutter/material.dart';

class TLThirdPage extends StatelessWidget {
  const TLThirdPage({super.key});

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
          const Divider(), // To separate the two lists
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
