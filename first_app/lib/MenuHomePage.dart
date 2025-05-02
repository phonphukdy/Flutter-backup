import 'package:first_app/BottomNVB.dart';
import 'package:first_app/Drawer_Menu.dart';
import 'package:first_app/subtabBar/HomeManage.dart';
import 'package:first_app/subtabBar/SalePage.dart';
import 'package:flutter/material.dart';

// List itms = [
//   "ຂໍ້ມູນຫົວໜ່ວຍ",
//   "ປະເພດສິນຄ້າ",
//   "ຂໍ້ມູນສິນຄ້າ",
//   "ຂໍ້ມູນຜູ້ສະໜອງສິນຄ້າ",
//   "ຂໍ້ມູນລູກຄ້າ",
//   "ຂໍ້ມູນພະນັກງານ",
//   "ອັດຕາແລກປ່ຽນ",
// ];

// List iconsize = [79];
// List iconColor = [const Color.fromARGB(254, 28, 6, 74)];
// List icon = [
//   Icon(Icons.ac_unit, size: iconsize[-1], color: iconColor[0]),
//   Icon(Icons.category, size: iconsize[-1], color: iconColor[0]),
//   Icon(Icons.folder, size: iconsize[-1], color: iconColor[0]),
//   Icon(Icons.delivery_dining_rounded, size: iconsize[-1], color: iconColor[0]),
//   Icon(Icons.person, size: iconsize[-1], color: iconColor[0]),
//   Icon(Icons.person_add_alt, size: iconsize[-1], color: iconColor[0]),
//   Icon(
//     Icons.currency_exchange_outlined,
//     size: iconsize[-1],
//     color: iconColor[-1],
//   ),
// ];

class MenuHomePage extends StatefulWidget {
  const MenuHomePage({super.key});

  @override
  State<MenuHomePage> createState() => _MenuHomePageState();
}

class _MenuHomePageState extends State<MenuHomePage> {
  Widget popUpMenuBTN() {
    return PopupMenuButton<String>(
      itemBuilder:
          (c) => [
            PopupMenuItem(
              child: Card(
                elevation: 15,
                child: ListTile(
                  leading: Icon(Icons.wifi, size: 25, color: Colors.blue),
                  title: Text(
                    "ເຊື່ອມຕໍ່ Internet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialogAlert();
                  },
                ),
              ),
            ),

            PopupMenuDivider(),

            PopupMenuItem(
              child: Card(
                elevation: 15,
                child: ListTile(
                  leading: Icon(Icons.storage, size: 25, color: Colors.blue),
                  title: Text(
                    "ເຊື່ອມຕໍ່ database",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            PopupMenuDivider(),

            PopupMenuItem(
              child: Card(
                elevation: 15,
                child: ListTile(
                  leading: Icon(Icons.settings, size: 25, color: Colors.blue),
                  title: Text(
                    "ຕັ້ງຄ່າ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
    );
  }

  void showDialogAlert() {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("ແຈ້ງເຕືອນ"),
          content: Text("ເຊື່ອມຕໍ່ກັບອິນເຕີເນັດ"),
          actions: [
            Divider(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: "IP",
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: "User",
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: "Password",
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      "Cancle",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ພັດທະນາແອັບດ້ວຍ Flutter 1"),
          actions: [popUpMenuBTN()],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.folder, size: 25, color: Colors.blue),
                text: "ຈັດການຂໍ້ມູນພື້ນຖານ",
              ),

              Tab(
                icon: Icon(Icons.shop, size: 25, color: Colors.blue),
                text: "ຂາຍ",
              ),

              Tab(
                icon: Icon(Icons.arrow_forward, size: 25, color: Colors.blue),
                text: "ສັ່ງຊື້ສິນຄ້າ",
              ),

              Tab(
                icon: Icon(Icons.arrow_back, size: 25, color: Colors.blue),
                text: "ນຳເຂົ້າສິນຄ້າ",
              ),

              Tab(
                icon: Icon(Icons.search, size: 25, color: Colors.blue),
                text: "ຄົ້ນຫາສິນຄ້າ",
              ),

              Tab(
                icon: Icon(Icons.bar_chart, size: 25, color: Colors.blue),
                text: "ລາຍງານ",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeManage(),
            SalePage(),
            Center(child: Text("Order")),
            Center(child: Text("Import")),
            Center(child: Text("Search")),
            Center(child: Text("Report")),
          ],
        ),
        drawer: Drawer_Menu(),
        bottomNavigationBar: BottomNVB(),
      ),
    );
  }
}
