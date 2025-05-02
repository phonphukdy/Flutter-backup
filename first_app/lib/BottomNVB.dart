import 'package:flutter/material.dart';

class BottomNVB extends StatefulWidget {
  const BottomNVB({super.key});

  @override
  State<BottomNVB> createState() => _BottomNVBState();
}

class _BottomNVBState extends State<BottomNVB> {
  int idx = 0;

  void selectIndex(int indx) {
    setState(() {
      idx = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.amber.shade900,
      selectedItemColor: Colors.white,
      iconSize: 60,
      unselectedFontSize: 14,
      selectedFontSize: 25,
      currentIndex: idx,
      onTap: selectIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 35),
          label: "ໜ້າຫຼັກ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, size: 35),
          label: "ຂໍ້ຄວາມ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward, size: 35),
          label: "ເຂົ້າສູ່ລະບົບ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert, size: 35),
          label: "ບໍລິການ",
        ),
      ],
    );
  }
}
