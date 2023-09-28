import 'dart:io';
import 'dart:typed_data';

import 'package:anwarkabir/profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

enum GenderTypeEnum { Male, Female, Others }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emialController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _gender = '';
  GenderTypeEnum? _genderTypeEnum;
  List? _genderlist;
  bool _showPassword = false;
  bool _showConfromPassord = false;
  bool agree = false;
  // Variable to hold the selected image file
  PlatformFile? _imageFile;

  //image picker package
  File? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emialController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _controller.dispose();

    super.dispose();
  }

  List<String> genderlist = ["Male", "Female", "Others"];

  void _submitform() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(
                    name: _nameController.text,
                    phone: _phoneController.text,
                    email: _emialController.text,
                    birth: _controller.text,
                    gender: _genderTypeEnum.toString(),
                    // image: _image,
                  )));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {}
  }

  // Method to pick and display an image file
  Future<void> _pickImage() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _imageFile = result.files.first;
      });
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // If image file is not null, display it using Image widget
                // if (_imageFile != null)
                //   Image.memory(
                //     Uint8List.fromList(_imageFile!.bytes!),
                //     height: 70,
                //     width: 70,
                //     fit: BoxFit.cover,
                //   ),

                // SizedBox(
                //   height: 10,
                // ),
                // // A button to trigger the file picker dialog

                // ElevatedButton(
                //   onPressed: _pickImage,
                //   child: const Text('Pick an image'),
                // ),

                // ElevatedButton(
                //   onPressed: () async {
                //     final pickedImage = await ImagePicker()
                //         .getImage(source: ImageSource.gallery);
                //     if (pickedImage != null) {
                //       _image = File(pickedImage.path);
                //     }
                //   },
                //   child: Text('Select Image'),
                // ),

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Enter your name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "enter your phone number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (value.length < 11) {
                      return "Please enter a valited number";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emialController,
                  decoration: InputDecoration(labelText: "Enter your email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your email please";
                    }
                    if (!value.contains("@")) {
                      return "Please enter valided email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  obscureText: !_showPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showConfromPassord = !_showConfromPassord;
                            });
                          },
                          icon: Icon(_showConfromPassord
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  obscureText: !_showConfromPassord,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                Text('Gender'),

                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                          contentPadding: EdgeInsets.all(0.0),
                          value: GenderTypeEnum.Male,
                          groupValue: _genderTypeEnum,
                          dense: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          tileColor: Colors.deepPurple.shade50,
                          title: Text(GenderTypeEnum.Male.name),
                          onChanged: (val) {
                            setState(() {
                              _genderTypeEnum = val;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                          contentPadding: EdgeInsets.all(0.0),
                          value: GenderTypeEnum.Female,
                          groupValue: _genderTypeEnum,
                          dense: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          tileColor: Colors.deepPurple.shade50,
                          title: Text(GenderTypeEnum.Female.name),
                          onChanged: (val) {
                            setState(() {
                              _genderTypeEnum = val;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                          contentPadding: EdgeInsets.all(0.0),
                          value: GenderTypeEnum.Others,
                          groupValue: _genderTypeEnum,
                          dense: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          tileColor: Colors.deepPurple.shade50,
                          title: Text(GenderTypeEnum.Others.name),
                          onChanged: (val) {
                            setState(() {
                              _genderTypeEnum = val;
                            });
                          }),
                    ),
                  ],
                ),

                // ToggleButtons(
                //   isSelected: [
                //     _gender == 'Male',
                //     _gender == 'Female',
                //     _gender == 'Other',
                //   ],
                //   onPressed: (int index) {
                //     setState(() {
                //       if (index == 0) {
                //         _gender = 'Male';
                //       } else if (index == 1) {
                //         _gender = 'Female';
                //       } else {
                //         _gender = 'Other';
                //       }
                //     });
                //   },
                //   children: [
                //     Text('Male'),
                //     Text('Female'),
                //     Text('Other'),
                //   ],
                // ),
                SizedBox(height: 16.0),
                Text('Date of Birth'),

                // Text(
                //     "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}"),

                // ElevatedButton(
                //     onPressed: () async {
                //       final DateTime? dateTime = await showDatePicker(
                //           context: context,
                //           initialDate: selectedDate,
                //           firstDate: DateTime(1971),
                //           lastDate: DateTime(2030));
                //           // if(dateTime! = null){
                //           //   setState(() {
                //           //     selectedDate = dateTime;
                //           //   });
                //           // }
                //     },
                //     child: const Text("Choose date")),

                // ElevatedButton(
                //   onPressed: () => _selectDate(context),
                //   child: Text(
                //     _selectedDate != null
                //         ? _selectedDate.toString()
                //         : 'Select Date',
                //   ),
                // ),
                TextField(
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
                                _controller.text = DateFormat('MM/dd/yyyy')
                                    .format(_selectedDate);

                                print(_controller.text);
                              });
                            });
                          },
                          icon: Icon(Icons.calendar_month))),
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      }),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I have read and accept ',
                        ),
                        TextSpan(
                          text: 'terms and conditions',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(Uri.https('flutter.dev'));
                            },
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ]),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: agree ? _submitform : null,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
