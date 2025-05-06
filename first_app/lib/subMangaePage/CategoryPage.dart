import 'dart:io';

import 'package:first_app/subtabBar/HomeManage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController txtdate = TextEditingController();
  PickedFile? imgFile;
  final ImagePicker impk = ImagePicker();

  void takePhoto(ImageSource source) async {
    final fileimg = await impk.pickImage(
      source: source,
    ); // source ແມ່ນທີມາຂອງຮູບ
    setState(() {
      imgFile = PickedFile(fileimg!.path);
    });
  }

  void SelectPhoto() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 120,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Text(
                "ເລືອກຮູບພາບຈາກ",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.blue, thickness: 2),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.camera,
                            color: Colors.green.shade800,
                            size: 25,
                          ),
                          title: Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            takePhoto(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Colors.green.shade800,
                            size: 25,
                          ),
                          title: Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            takePhoto(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate() async {
    try {
      final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2035),
      );

      if (date != null) {
        setState(() {
          txtdate.text = "${date.day}/${date.month}/${date.year}";
        });
      }
    } catch (err) {
      print(err);
    }
  } // ລໍຖ້າການເຮັດວຽກຂອງເຮົາຢູ່ ຈະບໍ່ຕັດຖິ້ມ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ຈັດການຂໍ້ມູນປະເພດສິນຄ້າ')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 120.0,
                  backgroundImage:
                      imgFile == null
                          ? AssetImage("images/logo.png")
                          : FileImage(File(imgFile!.path)),
                ),
                Positioned(
                  bottom: 18.0,
                  right: 18.0,
                  child: PopupMenuButton<String>(
                    itemBuilder:
                        (c) => [
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.camera,
                                color: Colors.green.shade800,
                                size: 25,
                              ),
                              title: Text(
                                "Camera",
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                takePhoto(ImageSource.camera);
                                Navigator.of(
                                  context,
                                ).pop(); // or use Navigator.of(context).pop(); if available
                              },
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.image,
                                color: Colors.green.shade800,
                                size: 25,
                              ),
                              title: Text(
                                "Gallery",
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                takePhoto(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                    icon: Icon(
                      Icons.camera_alt,
                      size: 45,
                      color: Colors.amber.shade900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            SizedBox(
              width:
                  MediaQuery.of(context).size.width *
                  0.7, // ຫຍໍ້ຂະໜາດຂອງ SizeBox
              child: TextField(
                controller: txtdate,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate();
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // ບໍ່ເອົາເສັ້ນຂອບ
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade500,
                    ), // ຕອນຄິກເລືອກມັນເສັ້ນຈະສະແດງອອກມາ
                  ),
                  filled: true, // ຈະມີສີພື້ນຫຼັງ ຄ້າຍໆ lint
                  prefix: Icon(
                    Icons.calendar_today,
                    size: 25,
                    color: Colors.green.shade500,
                  ),
                  labelText: "ວ.ດ.ປ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
