import 'package:first_app/Drawer_Menu.dart';
import 'package:flutter/material.dart';

class MenuHomePage extends StatefulWidget {
  const MenuHomePage({super.key});

  @override
  State<MenuHomePage> createState() => _MenuHomePageState();
}

class _MenuHomePageState extends State<MenuHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ພັດທະນາແອັບດ້ວຍ Flutter 1")),
      drawer: Drawer_Menu(),
    );
  }
}
