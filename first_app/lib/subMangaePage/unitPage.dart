import 'package:flutter/material.dart';

class unitPage extends StatefulWidget {
  const unitPage({super.key});

  @override
  State<unitPage> createState() => _unitPageState();
}

class _unitPageState extends State<unitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ຈັດການຂໍ້ມູນຫົວໜ່ວຍ')),
      body: Center(child: Text('ຂໍ້ມູນຫົວໜ່ວຍ')),
    );
  }
}
