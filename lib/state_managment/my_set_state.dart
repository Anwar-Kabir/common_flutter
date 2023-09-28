import 'package:flutter/material.dart';

class MySetState extends StatefulWidget {
  const MySetState({super.key});

  @override
  State<MySetState> createState() => _MySetStateState();
}

class _MySetStateState extends State<MySetState> {
  int conut = 0;

  void _incriment() {
    setState(() {
      if (conut < 5) {
        conut++;
      } else if (conut == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cant go above 5'),
          ),
        );
      }
    });
  }

  void _decriment() {
    setState(() {
      if (conut >= 1) {
        conut--;
      } else if (conut == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("cant go below 0")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("set state counter"),
      ),
      body: Row(
        children: [
          IconButton(
            onPressed: _decriment,
            icon: const Icon(Icons.remove),
          ),
          Text(conut.toString()),
          IconButton(onPressed: _incriment, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
