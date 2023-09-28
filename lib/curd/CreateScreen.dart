import 'package:anwarkabir/curd/model/model.dart';
import 'package:anwarkabir/curd/read_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late final Box dataBox;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box('data_box');
  }

  _createData() {
    Data newData = Data(
      title: _titleController.text,
      description: _descriptionController.text,
    );
    dataBox.add(newData);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Title',
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Description',
                  labelText: 'Description',
                ),
              ),
      
              ElevatedButton(
              onPressed: () {
                _createData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadScreen(),
                  ),
                );
              },
              child: const Text('ADD DATA'),
            )
      
          ],
        ),
      ),
    );
  }
}
