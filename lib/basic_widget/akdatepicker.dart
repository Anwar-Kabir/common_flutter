import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AKDatePicker extends StatefulWidget {
  const AKDatePicker({super.key});

  @override
  State<AKDatePicker> createState() => _AKDatePickerState();
}

class _AKDatePickerState extends State<AKDatePicker> {
  TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              labelText: 'Birthday',
              hintText: 'MM/DD/YYYY',
              prefixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then((date) {
                      setState(() {
                        _selectedDate = date!;
                        _controller.text =
                            DateFormat('MM/dd/yyyy').format(_selectedDate);
                      });
                    });
                  },
                  icon: Icon(Icons.calendar_month))),
          readOnly: true,
        ),
      ),
    );
  }
}
