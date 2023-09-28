import 'package:flutter/material.dart';

class SarchHome extends StatelessWidget {
  SarchHome({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xffe21b70),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: Colors.white70,
              hintText: "Search for shop & restauarns",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
        ),
      ),
    );
  }
}
