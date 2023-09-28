import 'package:flutter/material.dart';

class PrimeBankAnimation extends StatelessWidget {
  const PrimeBankAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Welcome',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'MyPrime',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(),
            SizedBox(
              height: 5,
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
