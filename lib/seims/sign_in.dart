import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Column(
        children: [
          Text("Sign up"),
          Form(
            child: TextFormField(
                controller: _phoneNumber,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please Enter the phone number";
                  }
                  if (value.length < 10) {
                    return "Phone Number should be at least 11 number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("lable"),
                )),
          )
        ],
      ),
    );
  }
}
