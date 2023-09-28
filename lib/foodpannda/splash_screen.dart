import 'package:anwarkabir/foodpannda/fp_home.dart';
import 'package:flutter/material.dart';

class FPSplashS extends StatefulWidget {
  const FPSplashS({super.key});

  @override
  State<FPSplashS> createState() => _FPSplashSState();
}

class _FPSplashSState extends State<FPSplashS> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const FPHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe21b70),
        body: Center(child: Image.asset("assets/foodpanda.jpg")));
  }
}
