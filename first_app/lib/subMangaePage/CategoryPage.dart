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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ຈັດການຂໍ້ມູນປະເພດສິນຄ້າ')),
      body: Center(
        child: Stack(
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
      ),
    );
  }
}
