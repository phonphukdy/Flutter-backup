import 'package:first_app/subchapter1/ButtonPage.dart';
import 'package:first_app/subchapter1/ListViewPage.dart';
import 'package:first_app/subchapter1/TextFieldPage.dart';
import 'package:first_app/subchapter1/TextPage.dart';
import 'package:flutter/material.dart';

List itms = [TextPage(), TextFieldPage(), ButtonPage(), ListViewPage()];

List Icns = [
  Icon(Icons.text_format),
  Icon(Icons.text_snippet_outlined),
  Icon(Icons.smart_button_outlined),
  Icon(Icons.list_alt_outlined),
];

List Txt = [
  "ການໃຊ້ Text Widget",
  "ການໃຊ້ TextFieldWidget",
  "ການໃຊ້ Button Widget",
  "ການໃຊ້ ListView Widget",
];

class submenu extends StatefulWidget {
  const submenu({super.key});

  @override
  State<submenu> createState() => _submenuState();
}

class _submenuState extends State<submenu> {
  void selectPage(int idx) {
    setState(() {
      if (idx < itms.length) {
        MaterialPageRoute route = MaterialPageRoute(builder: (c) => itms[idx]);
        Navigator.of(context).push(route);
      } else {
        showDialog(
          context: context,
          builder: (c) {
            return AlertDialog(
              title: Text("ແຈ້ງເຕືອນ"),
              content: Text("ໜ້າ page ຍັງບໍ່ຖືກສ້າງ"),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດຮຽນທີ່ 1")),
      body: Container(
        margin: EdgeInsets.all(2),
        child: GridView.builder(
          itemCount: itms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (c, idx) {
            return InkWell(
              onTap: () {
                selectPage(idx);
              },
              child: Card(
                elevation: 15,
                shadowColor: Colors.amber,
                child: Container(
                  width: 100,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.green.shade900, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        idx < Icns.length ? Icns[idx].icon : Icons.help_outline,
                        // Icons.book,
                        color: const Color.fromARGB(255, 148, 72, 211),
                        size: 100,
                      ),
                      SizedBox(height: 18),
                      Text(
                        idx < Txt.length ? Txt[idx] : "ວ່າງເປົ່າ",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 78, 74, 195),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
