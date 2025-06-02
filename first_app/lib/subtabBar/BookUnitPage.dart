import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List itm = [];
List filteredList = [];

class BookUnitPage extends StatefulWidget {
  const BookUnitPage({super.key});

  @override
  State<BookUnitPage> createState() => _BookUnitPageState();
}

class _BookUnitPageState extends State<BookUnitPage> {
  String chk = ""; // เก็บค่า bookid ไว้ตรวจเงื่อนไขเพิ่ม/แก้ไข
  TextEditingController txtSearch = TextEditingController();

  TextEditingController txtbid = TextEditingController();
  TextEditingController txtname = TextEditingController();

  final url = "http://localhost:8000/unit/";

  @override
  void initState() {
    fetchAllData();
    super.initState();
  }

  Future<void> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          itm = jsonResponse['result'];
          print(itm);
          filteredList = List.from(itm);
        });
      }
    } catch (err) {
      print(err);
    }
  }

  void filterSearch(String query) {
    List tmpList = [];
    if (query.isEmpty) {
      tmpList = List.from(itm);
    } else {
      tmpList =
          itm.where((element) {
            final idStr = element['Uid'].toString();
            final nameStr = element['Uname'].toString().toLowerCase();
            final q = query.toLowerCase();
            return idStr.contains(q) || nameStr.contains(q);
          }).toList();
    }
    setState(() {
      filteredList = tmpList;
    });
  }

  Future<void> AddBook(String bookunit) async {
    try {
      final String urlAdd = "http://localhost:8000/unit/";
      final response = await http.post(
        Uri.parse(urlAdd),
        headers: {"content-type": "application/json"},
        body: json.encode({"Uname": bookunit}),
      );
      if (response.statusCode == 200) {
        fetchAllData();
      } else {
        print('Add failed: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> DeleteBook(String uid) async {
    try {
      final urlDelete = "http://localhost:8000/unit/$uid";
      final response = await http.delete(Uri.parse(urlDelete));
      if (response.statusCode == 200) {
        fetchAllData();
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> EditData(String uid, String uname) async {
    try {
      final String urlUpdate = "http://localhost:8000/unit/$uid";
      final response = await http.put(
        Uri.parse(urlUpdate),
        headers: {"content-type": "application/json"},
        body: json.encode({"Uname": uname}),
      );
      if (response.statusCode == 200) {
        fetchAllData();
      } else {
        print('Update failed: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (err) {
      print(err);
    }
  }

  Widget TextBookID() {
    return TextFormField(
      controller: txtbid,
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.input, color: Colors.green, size: 25),
      ),
    );
  }

  Widget TextBookName() {
    return TextFormField(
      controller: txtname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.book, color: Colors.green, size: 25),
      ),
    );
  }

  void showAddBookDialog() {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text(chk == '' ? "ເພີ່ມຫົວໜ່ວຍ" : "ແກ້ໄຂຫົວໜ່ວຍ"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (chk != '') TextBookID(),
                SizedBox(height: 10),
                TextBookName(),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (chk == '') {
                  AddBook(txtname.text);
                } else {
                  EditData(chk, txtname.text);
                }
                Navigator.of(context).pop();
              },
              child: chk == '' ? Text("ບັນທຶກ") : Text("ແກ້ໄຂ"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ຍົກເລີກ"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຈັດການຫົວໜ່ວຍ'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              chk = "";
              txtbid.clear();
              txtname.clear();
              showAddBookDialog();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: TextField(
              controller: txtSearch,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.blue, size: 25),
                suffixIcon:
                    txtSearch.text.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            txtSearch.clear();
                            filterSearch('');
                          },
                        )
                        : null,
              ),
              onChanged: (value) {
                filterSearch(value);
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final item = filteredList[index];
          return ListTile(
            leading: Text('${item['Uid']}'),
            title: Text('${item['Uname']}'),
            onTap: () {
              chk = item['Uid'].toString();
              txtbid.text = item['Uid'].toString();
              txtname.text = item['Uname'];
              showAddBookDialog();
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    chk = item['Uid'].toString();
                    txtbid.text = item['Uid'].toString();
                    txtname.text = item['Uname'];
                    showAddBookDialog();
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green.shade700,
                    size: 25,
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (c) {
                        return AlertDialog(
                          title: Text('ແຈ້ງລຶບຂໍ້ມູນ'),
                          content: Text('ຕ້ອງການລຶບຂໍ້ມູນນີ້ຫຼືບໍ່?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                DeleteBook(item['Uid'].toString());
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: Colors.red, size: 25),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
