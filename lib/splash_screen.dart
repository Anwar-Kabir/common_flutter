import 'package:anwarkabir/my_home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFFA50E), Color(0xfff26D2B)])),
          ),
          Container(
            //color: Colors.blue,
            child: Center(
              child: Column(
                 children: [
                  
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: Colors.teal,
                        height: 80,
                        width: 80,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/alogo.png"))),
                  ),
                  const Text("From"),
                  const Text("Hitaishi"),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
