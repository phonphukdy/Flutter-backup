import 'package:flutter/material.dart';

class submenu_2 extends StatefulWidget {
  const submenu_2({super.key});

  @override
  State<submenu_2> createState() => _submenu_2State();
}

List itms = [];

List Icns = [Icon(Icons.abc), Icon(Icons.h_mobiledata)];

List Txt = ["ບົດທີ 2.1", "ບົດທີ 2.2"];

class _submenu_2State extends State<submenu_2> {
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
      appBar: AppBar(title: Text("ບົດທີ 2")),
      body: Container(
        margin: EdgeInsets.all(2),
        child: GridView.builder(
          itemCount: Icns.length,
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
