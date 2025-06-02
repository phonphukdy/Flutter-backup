import 'package:first_app/subMangaePage/CategoryPage.dart';
import 'package:first_app/subMangaePage/ProductsPage.dart';
import 'package:first_app/subMangaePage/unitpage.dart';
import 'package:first_app/subtabBar/BookPage.dart';
import 'package:first_app/subtabBar/BookUnitPage.dart';
import 'package:first_app/subtabBar/BookTypePage.dart';
import 'package:first_app/subtabBar/TestDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List itms = [
  "ຂໍ້ມູນຫົວໜ່ວຍ",
  "ປະເພດສິນຄ້າ",
  "ຂໍ້ມູນສິນຄ້າ",
  "ຂໍ້ມູນຜູ້ສະໜອງ",
  "ຂໍ້ມູນລູກຄ້າ",
  "ຂໍ້ມູນພະນັກງານ",
  "ອັດຕາແລກປ່ຽນ",
  "ຂໍ້ມູນປື້ມ",
];

List iconsize = [80];
List iconColor = [const Color.fromARGB(254, 28, 6, 74)];
List icon = [
  Icon(Icons.ac_unit, size: iconsize[0], color: iconColor[0]),
  Icon(Icons.category, size: iconsize[0], color: iconColor[0]),
  Icon(Icons.folder, size: iconsize[0], color: iconColor[0]),
  Icon(Icons.delivery_dining_rounded, size: iconsize[0], color: iconColor[0]),
  Icon(Icons.person, size: iconsize[0], color: iconColor[0]),
  Icon(Icons.person_add_alt, size: iconsize[0], color: iconColor[0]),
  Icon(
    Icons.currency_exchange_outlined,
    size: iconsize[0],
    color: iconColor[0],
  ),
  Icon(Icons.book, size: iconsize[0], color: iconColor[0]),
];

List manageItem = [
  unitPage(),
  CategoryPage(),
  ProductsPage(),
  TestDropdown(),
  CategoryPage(),
  BookUnitPage(),
  BookTypePage(),
  BookPage(),
];

class HomeManage extends StatefulWidget {
  const HomeManage({super.key});

  @override
  State<HomeManage> createState() => _HomeManageState();
}

class _HomeManageState extends State<HomeManage> {
  void selectPage(idx) {
    setState(() {
      if (idx < manageItem.length) {
        MaterialPageRoute route = MaterialPageRoute(
          builder: (c) => manageItem[idx],
        );
        Navigator.of(context).push(route);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("ແຈ້ງເຕືອນ"),
              content: Text("ຍັງບໍ່ມີໜ້ານີ້ເທື່ອ"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: itms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
          ), //ລວມກັນຈັກ column
          itemBuilder: (c, idx) {
            return InkWell(
              onTap: () {
                selectPage(idx);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(255, 60, 16, 107),
                    width: 2.0,
                  ),
                ),
                width: 60,
                height: 100,
                child: Column(
                  children: [
                    icon[idx],
                    Spacer(),
                    Text(
                      '${itms[idx]}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
