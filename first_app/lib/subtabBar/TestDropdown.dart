import 'package:flutter/material.dart';

class TestDropdown extends StatefulWidget {
  const TestDropdown({super.key});

  @override
  State<TestDropdown> createState() => _TestDropdownState();
}

class _TestDropdownState extends State<TestDropdown> {
  var myInitialItem = 'Item1';

  List<String> myItems = ['Item1', 'Item2', 'Item3', 'Item4', 'Item5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DropdownButton(
              onChanged: (value) {
                myInitialItem = value!;
                setState(() {});
              },
              value: myInitialItem,
              items:
                  myItems.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
