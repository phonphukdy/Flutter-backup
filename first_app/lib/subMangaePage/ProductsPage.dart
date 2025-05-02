import 'package:flutter/material.dart';

List itms = [
  "ພັດທະນາແອັບດ້ວຍ Flutter 1",
  "ພັດທະນາແອັບດ້ວຍ React Native",
  "ພັດທະນາແອັບດ້ວຍພາສາ C#.NET",
  "ພັດທະນາແອັບດ້ວຍພາສາ Java 2",
];

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? selectItem;

  Widget showMadalBS() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.share, color: Colors.green.shade800, size: 25),
            ),
            title: Text(
              'Share',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.copy, color: Colors.green.shade800, size: 25),
            ),
            title: Text(
              'copy',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.delete, color: Colors.green.shade800, size: 25),
            ),
            title: Text(
              'delete',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.edit, color: Colors.green.shade800, size: 25),
            ),
            title: Text(
              'Edit',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.message,
                color: Colors.green.shade800,
                size: 25,
              ),
            ),
            title: Text(
              'Message',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (c) => showMadalBS(),
              );
            },
            icon: Icon(Icons.add, size: 30, color: Colors.white),
          ),
        ],
        title: Text('ຈັດການຂໍ້ມູນສິນຄ້າ'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            child: DropdownButton(
              isExpanded: true,
              hint: Text('ກະລຸນາເລືອກລາຍການ'),
              value: selectItem,
              items:
                  itms.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.book_online_outlined,
                            size: 25,
                            color: Colors.amber.shade800,
                          ),
                        ),
                        title: Text(
                          '${c}',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        // onTap: () {
                        //   print('${selectItem}');
                        // },
                      ),
                    );
                  }).toList(),
              onChanged: (newal) {
                setState(() {
                  selectItem = newal.toString();
                });
              },
            ),
          ),
        ),
      ),
      body: Center(
        child:
            selectItem == null
                ? Text(
                  'ກະລຸນາເລືອກລາຍການ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
                : Text(
                  '${selectItem}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
