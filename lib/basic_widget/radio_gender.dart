import 'package:flutter/material.dart';

class RadioButtonAK extends StatefulWidget {
  const RadioButtonAK({super.key});

  @override
  State<RadioButtonAK> createState() => _RadioButtonAKState();
}

class _RadioButtonAKState extends State<RadioButtonAK> {
  
  String selectedGender = '';

  void handleGenderChange (String? value){
    setState(() {
      selectedGender != value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  Column(
        children: [
          RadioListTile(
                title: Text('Male'),
                value: 'Male',
                groupValue: selectedGender,
                onChanged: handleGenderChange,
              ),
              RadioListTile(
                title: Text('Female'),
                value: 'Female',
                groupValue: selectedGender,
                onChanged: handleGenderChange,
              ),
              RadioListTile(
                title: Text('Other'),
                value: 'Other',
                groupValue: selectedGender,
                onChanged: handleGenderChange,
              ),
        ],
      )
    );
  }
}