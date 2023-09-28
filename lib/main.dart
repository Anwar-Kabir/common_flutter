import 'dart:html';
import 'dart:ui_web';

import 'package:anwarkabir/akcrud/akcrud_main.dart';
import 'package:anwarkabir/animation/my_prime_bank_animation.dart';
import 'package:anwarkabir/basic_widget/akdatepicker.dart';
import 'package:anwarkabir/basic_widget/a_z_z_a.dart';
import 'package:anwarkabir/basic_widget/division_district.dart';
import 'package:anwarkabir/basic_widget/radio_gender.dart';
import 'package:anwarkabir/curd/CreateScreen.dart';
import 'package:anwarkabir/div_dis.dart';
import 'package:anwarkabir/foodpannda/splash_screen.dart';
import 'package:anwarkabir/seims/sign_in.dart';
import 'package:anwarkabir/sign_up.dart';
import 'package:anwarkabir/splash_screen.dart';
import 'package:anwarkabir/state_managment/my_set_state.dart';
import 'package:anwarkabir/ui/otp.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('data_box');
  // bootstrapEngine(
  //   entrypoint: myAppEntrypoint,
  //   window: window,
  //   userAgent: window.navigator.userAgent,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUp(),
      //SignUp(),
    );
  }
}
