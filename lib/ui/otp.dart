import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onSaved: (pin1) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: ""),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onSaved: (pin2) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: ""),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onSaved: (pin3) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: ""),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 64,
                width: 68,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onSaved: (pin4) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: ""),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
