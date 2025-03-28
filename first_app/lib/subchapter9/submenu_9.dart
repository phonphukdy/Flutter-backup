import 'package:flutter/material.dart';

class submenu_9 extends StatefulWidget {
  const submenu_9({super.key});

  @override
  State<submenu_9> createState() => _submenu_9State();
}

List itms = [];

List Icns = [
  Icon(Icons.fastfood),
  Icon(Icons.check_circle),
  Icon(Icons.no_meals),
  Icon(Icons.equalizer),
  Icon(Icons.phone_forwarded),
  Icon(Icons.dark_mode),
  Icon(Icons.insert_invitation),
  Icon(Icons.do_disturb_off_outlined),
  Icon(Icons.colorize),
];

List Txt = [
  "ບົດທີ 9.1",
  "ບົດທີ 9.2",
  "ບົດທີ 9.3",
  "ບົດທີ 9.4",
  "ບົດທີ 9.5",
  "ບົດທີ 9.6",
  "ບົດທີ 9.7",
  "ບົດທີ 9.8",
  "ບົດທີ 9.9",
];

class _submenu_9State extends State<submenu_9> {
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
      appBar: AppBar(title: Text("ບົດທີ 9")),
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
