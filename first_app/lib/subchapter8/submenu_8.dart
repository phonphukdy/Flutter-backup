import 'package:flutter/material.dart';

class submenu_8 extends StatefulWidget {
  const submenu_8({super.key});

  @override
  State<submenu_8> createState() => _submenu_8State();
}

List itms = [];

List Icns = [
  Icon(Icons.face),
  Icon(Icons.local_fire_department),
  Icon(Icons.on_device_training),
  Icon(Icons.park),
  Icon(Icons.pin_drop),
  Icon(Icons.insert_drive_file),
  Icon(Icons.zoom_in_map),
  Icon(Icons.exposure_zero),
];

List Txt = [
  "ບົດທີ 8.1",
  "ບົດທີ 8.2",
  "ບົດທີ 8.3",
  "ບົດທີ 8.4",
  "ບົດທີ 8.5",
  "ບົດທີ 8.6",
  "ບົດທີ 8.7",
  "ບົດທີ 8.8"
];

class _submenu_8State extends State<submenu_8> {
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
      appBar: AppBar(title: Text("ບົດທີ 8")),
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
