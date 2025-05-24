import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List itm = [];
  int? selectValue;
  List<String> itms = [];

  String chk = ""; // ເກັບຄ່າ bookid ເອົາໄວ້ໃນການກວດສອບເງື່ອນໄຂ
  TextEditingController txtSearch = TextEditingController();

  TextEditingController txtbid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtpage = TextEditingController();

  final url = "http://localhost:8000/book/";

  @override
  void initState() {
    fetchAllData();
    fetchAndAddBookTypes();
    // searchData("");
    super.initState();
  }
  // initState ຈະຖືກເອີ້ນໃຊ້ໂດຍອັດຕະໂນມັດດ້ວຍຕົວ framework ເອງ
  // super.initState() ຖ້າບໍ່ໃຊ້ໂຕນີ້ໃນການເອີ້ນຕາມລຳດັບອາດເຮັດໃຫ້ເກີດຂໍ້ຜິດພາດໄດ້
  // ທີຕ້ອງໃຊ້ initState ແບບນີ້ເພາະວ່າ fetchAllData ມັນໃຊ້ເວລາ (async (Fututre)) ດັ່ງນັ້ນຈື່ງຕ້ອງເອົາມັນມາໂຫຼດຖ້າໃນຕອນເປີດນໜ້ານີ້ເລີຍ ຈືງເຮັດໃຫ້ມັນໄວຂື້ນ, ຖ້າໄປເອີ້ນໃຊ້ຕາມຫຼັງຂໍ້ມູນຈະບໍ່ໂຊທັນທີເພາະຖ້າໂຫຼດຢູ່

  // fetch booktype then assign in
  Future<void> fetchAndAddBookTypes() async {
    final response = await http.get(Uri.parse('http://localhost:8000/btype'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['result'];
      itms.addAll(results.map((item) => item['booktype_name'] as String));
    } else {
      throw Exception('Failed to load book types');
    }
  }

  // fetch data
  Future<void> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          itm =
              jsonResponse['result']; // ຕ້ອງອ້າງອີງຖືງ key result ເພາະມັນສົ່ງມາແບບນີ້ຈືງຈະໄດ້ຂໍ້ມູນ json
        });
        // print(response.body);
        // setState(() {

        //   // data = json.decoder(response.body);
        //   data = jsonDecode(response.body);
        // });
      }
      // print(data);
    } catch (err) {
      // print(err);
    }
  }

  // search function
  Future<void> searchData(String data) async {
    try {
      // final String urlSearch = url + "${data}";
      final String urlSearch = url + data;
      // final urlSearch = "http://localhost:8000/book/$data";
      final response = await http.get(Uri.parse(urlSearch));
      if (response.statusCode == 200) {
        itm.clear();
        setState(() {
          itm = json.decode(response.body);
        });
      }
    } catch (err) {
      print(err);
    }
  }

  // insert functionk
  Future<void> AddBook(
    String bookid,
    String bookname,
    String price,
    String page,
    int? btypeid,
  ) async {
    try {
      final String urlAdd = "http://localhost:8000/book/";
      final response = await http.post(
        Uri.parse(urlAdd),
        headers: {"content-type": "application/json"},
        body: json.encode({
          "bid": bookid,
          "bookname": bookname,
          "price": price,
          "page": page,
          "btypeid": btypeid,
        }),
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

  // delete function
  Future<void> DeleteBook(String bid) async {
    try {
      final urlDelete = "http://localhost:8000/book/$bid";
      final response = await http.delete(
        Uri.parse(urlDelete), // ບໍ່ໄດ້ໃສ່ header ແລ້ວ
      );
      if (response.statusCode == 200) {
        print(response.body);
        // setState(() {
        //   fetchAllData();
        // });
        fetchAllData();
      }
    } catch (err) {
      print(err);
    }
  }

  // update function
  void EditData(
    String bookid,
    String bookname,
    String price,
    String page,
    int? selectValue,
  ) async {
    try {
      final String urlUpdate = "http://localhost:8000/book/$bookid";
      final response = await http.put(
        Uri.parse(urlUpdate),
        headers: {"content-type": "application/json"},
        body: json.encode({
          "bookname": bookname,
          "price": price,
          "page": page,
          "btypeid": selectValue,
        }),
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

  // ສ້າງ Widget 4 ອັນເປັນ textformfield ສຳຫຼັບທັງ 4 ອັນຄື: txtbid, txtbname, txtpage, txtprice
  Widget TextBookID() {
    return TextFormField(
      controller: txtbid,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.input, color: Colors.green, size: 25),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "ກະລຸນາປ້ອນລະຫັດປື້ມ";
        } else {
          return null;
        }
      },
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
      validator: (value) {
        if (value!.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນປື້ມ";
        } else {
          return null;
        }
      },
    );
  }

  Widget TextBookPrice() {
    return TextFormField(
      controller: txtprice,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.currency_exchange,
          color: Colors.green,
          size: 25,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "ກະລຸນາປ້ອນລາຄາ";
        } else {
          return null;
        }
      },
    );
  }

  Widget TextBookPage() {
    return TextFormField(
      controller: txtpage,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.pages, color: Colors.green, size: 25),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "ກະລຸນາປ້ອນຈຳນວນໜ້າ";
        } else {
          return null;
        }
      },
    );
  }

  Widget TextBookTypePage() {
    return DropdownButton<int>(
      hint: Text("ເລືອກປະເພດປື້ມ"),
      value: selectValue,
      items: List.generate(itms.length, (index) {
        final c = itms[index];
        return DropdownMenuItem<int>(
          value: index,
          child: Text('$c', style: TextStyle(color: Colors.blue, fontSize: 18)),
        );
      }),
      onChanged: (newIndex) {
        setState(() {
          selectValue = newIndex;
          print("เลือก index: $selectValue (${itms[selectValue!]})");
        });
      },
    );
  }

  void showAddBookDialog() {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("ສະແດງການເພີ່ມຂໍ້ມູນປື້ມ"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextBookID(),
                SizedBox(height: 10),
                TextBookName(),
                SizedBox(height: 10),
                TextBookPrice(),
                SizedBox(height: 10),
                TextBookPage(),
                SizedBox(height: 10),
                TextBookTypePage(),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (chk == "") {
                  AddBook(
                    txtbid.text,
                    txtname.text,
                    txtprice.text,
                    txtpage.text,
                    selectValue,
                  );
                } else {
                  EditData(
                    txtbid.text,
                    txtname.text,
                    txtprice.text,
                    txtpage.text,
                    selectValue,
                  );
                }
                Navigator.of(context).pop();
              },
              child: chk == '' ? Text("ບັນທຶກຂໍ້ມູນ") : Text("ແກ້ໄຂຂໍ້ມູນ"),
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
        title: Text('ຈັດການຂໍ້ມູນປື້ມ'),
        actions: [
          IconButton(
            onPressed: () {
              chk = "";
              txtbid.clear();
              txtname.clear();
              txtprice.clear();
              txtpage.clear();
              showAddBookDialog();
            },
            icon: Icon(Icons.add),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: TextField(
              onChanged: (val) {
                // ດັກຈັບ event ທາງຄີບອດ
                if (txtSearch.text.isEmpty) {
                  fetchAllData();
                }
                // } else {
                // searchData(txtSearch.text);
                // }
              },
              controller: txtSearch,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true, // default pen sy grey
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.input, size: 25, color: Colors.blue),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        txtSearch.clear();
                        fetchAllData();
                      },
                      child: Icon(Icons.close, size: 35, color: Colors.red),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        searchData(txtSearch.text);
                      },
                      child: Icon(Icons.search, size: 35, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: itm.length,
          itemBuilder: (c, idx) {
            final itmdata = itm[idx];
            return Column(
              children: [
                ListTile(
                  leading: Text(
                    '${itmdata["bid"]}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    '${itmdata['bookname']}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${itmdata["price"]} ກີບ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${itmdata["page"]} ໜ້າ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          chk = itmdata['bid'];
                          txtbid.text = itmdata['bid'];
                          txtname.text = itmdata['bookname'];
                          txtprice.text = '${itmdata['price']}';
                          txtpage.text = '${itmdata['page']}';
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
                                content: Text(
                                  'ຕ້ອງການລຶບຂໍ້ມູນນີ້ຫຼືບໍ່? [yes/no]',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      DeleteBook(itmdata['bid'].toString());
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Yes'),
                                  ),
                                  Spacer(),
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
                        icon: Icon(
                          Icons.delete,
                          color: Colors.green.shade700,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    itmdata['booktype_name'],
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.green, thickness: 1),
              ],
            );
          },
        ),
      ),
    );
  }
}
