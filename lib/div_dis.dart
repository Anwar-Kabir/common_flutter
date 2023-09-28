import 'package:flutter/material.dart';

class MyHomePageM extends StatefulWidget {
  @override
  _MyHomePageMState createState() => _MyHomePageMState();
}

class _MyHomePageMState extends State<MyHomePageM> {
  String _division = '';
  String _district = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dropdown Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("আমার এলাকার খবর"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefix: Text("বিভাগ"),
                  suffix: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down))
                ),
              ),
            )
            ],
        ),
      ),
    );
  }
}
