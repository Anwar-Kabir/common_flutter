import 'package:flutter/material.dart';

class AZZA extends StatefulWidget {
  const AZZA({super.key});

  @override
  State<AZZA> createState() => _AZZAState();
}

class _AZZAState extends State<AZZA> {
  List <String> name = [
    "AAA",
    "BBB",
    "CCC"
    "DDD",
    "EEE",
    "FFF",
    "GGG"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Names in A - Z"),
          ...name.map((e) => Text(e)),
          Text("Name in Z - A"),
          ...name.reversed.map((e) => Text(e))
        ],

      ),
    );
  }
}