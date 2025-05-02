import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController txtn =
      TextEditingController(); //ຈັດການຂໍ້ມູນທີເຮົາຈະໃຊ້ໃນ text
  int count = 0;
  String txt = 'ສະແດງຕົວເລກ';

  void increment() {
    // refresh ໜ້າຕົນເອງ
    setState(() {
      count++;
      if (count != 0) {
        txt = 'ສະແດງຕົວເລກ';
      }
    });
  }

  void decrement() {
    // refresh ໜ້າຕົນເອງ
    setState(() {
      if (count <= 0) {
        txt = 'ສະແດງຕົວເລກ ແຕ່ 0 ຂຶ້ນໄປ';
      } else {
        count--;
      }
    });
  }

  void resetnumber() {
    // refresh ໜ້າຕົນເອງ
    setState(() {
      if (count >= 0) {
        count = 0;
        txt = 'ສະແດງຕົວເລກ ແຕ່ 0 ຂຶ້ນໄປ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade800,
          title: Text(
            'ລະບົບສັ່ງຊື້ສິນຄ້າ',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              resetnumber();
            },
            icon: Icon(Icons.menu, size: 25, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                increment();
              },
              icon: Icon(Icons.add, size: 25, color: Colors.white),
            ),

            //ໃສ່ກ໋ອງເປົ໋າເພື່ອໃຫ້ມີໄລຍະຫ່າງລະຫວ່າງ Icon
            SizedBox(width: 20),

            IconButton(
              onPressed: () {
                decrement();
              },
              icon: Icon(Icons.remove, size: 25, color: Colors.white),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: 25, color: Colors.white),
            ),
          ],
        ),

        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, //???
            children: [
              Text(
                '${txt}',
                style: TextStyle(fontSize: 22, color: Colors.blue.shade900),
              ),
              Text(
                '${count}',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: txtn, //ດືງຄ່າອອກຈາກ TextField
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.blue,
                    labelText: 'Enter number', // pen thung hint lae border
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (val) {
                    setState(() {
                      count = int.parse(val);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green.shade900,
          onPressed: () {
            increment();
          },
          child: Icon(Icons.add, size: 45, color: Colors.white),
        ),
      ),
    );
  }
}
