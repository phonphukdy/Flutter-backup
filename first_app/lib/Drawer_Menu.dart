import 'package:first_app/subchapter6/submenu_6.dart';
import 'package:first_app/subchapter1/submenu.dart';
import 'package:first_app/subchapter2/submenu_2.dart';
import 'package:first_app/subchapter3/submenu_3.dart';
import 'package:first_app/subchapter4/submenu_4.dart';
import 'package:first_app/subchapter5/submenu_5.dart';
import 'package:first_app/subchapter7/submenu_7.dart';
import 'package:first_app/subchapter8/submenu_8.dart';
import 'package:first_app/subchapter9/submenu_9.dart';
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
            elevation: 15, // create shawdow below card
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
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 2",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_2(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 3",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_3(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 4",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_4(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 5",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_5(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 6",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_6(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 7",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_7(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 8",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_8(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
          Card(
            elevation: 15,
            shadowColor: Colors.amber,
            child: ListTile(
              title: Text(
                "ບົດທີ 9",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => submenu_9(),
                );
                Navigator.of(context).push(route);
              },
              leading: Icon(Icons.book, size: 30, color: Colors.green.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
