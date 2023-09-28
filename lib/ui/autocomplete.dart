import 'package:flutter/material.dart';

class MyAutocomplete extends StatelessWidget {
  const MyAutocomplete({super.key});

  static const List<String> listitem = <String>["apple", "banana", "melon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Autocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable.empty();
        }
        return listitem.where(
            (element) => element.contains(textEditingValue.text.toLowerCase()));
      }),
    );
  }
}
