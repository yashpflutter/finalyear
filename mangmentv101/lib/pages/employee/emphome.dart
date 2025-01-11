import 'package:flutter/material.dart';

class EmpFirstPage extends StatelessWidget {
  const EmpFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: [
          const Text('PROJECTS',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            height: size.height / 2 - 100,
            width: size.width,
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
              reverse: true,
              itemCount: 10, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GestureDetector(
                        child: Container(
                      height: 112,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                      child: Text('Item ${index + 1} in List 1'),
                    )));
              },
            ),
          ),
          const Text('New Projects'), // To separate the two lists
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
