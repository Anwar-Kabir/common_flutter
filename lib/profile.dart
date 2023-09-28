import 'dart:io';

import 'package:anwarkabir/sign_up.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String birth;
  //final File image;
  //final GenderTypeEnum gender;
  final String gender;

  const Profile(
      {required this.name,
      required this.phone,
      required this.email,
      required this.birth,
      required this.gender,
      //required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Text("Name: $name"),
          Text("phone: $phone"),
          Text("email: $email"),
          Text("Birth: $birth"),
          Text("Gender: ${gender.split('.').last}"),
        ],
      ),
    );
  }
}
