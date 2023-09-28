import 'package:anwarkabir/foodpannda/common_widget/search_home.dart';
import 'package:flutter/material.dart';

class FPHome extends StatefulWidget {
  const FPHome({super.key});

  @override
  State<FPHome> createState() => _FPHomeState();
}

class _FPHomeState extends State<FPHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe21b70),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white)),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Merul Badda, Badda, dhaka 1212",
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              "Dhaka",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shop,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SarchHome(), Text("hello")],
        ),
      ),
    );
  }
}
