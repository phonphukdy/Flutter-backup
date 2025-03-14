import 'package:flutter/material.dart';

class Drawer_Menu extends StatefulWidget {
  const Drawer_Menu({super.key});

  @override
  State<Drawer_Menu> createState() => _Drawer_MenuState();
}

class _Drawer_MenuState extends State<Drawer_Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Image.asset("images/logo.png"),
            ),
            accountName: Text(
              "BCSP6A Mart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "02099xxxxxx",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 1",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
