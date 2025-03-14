import 'package:first_app/MenuHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        Center,
        Colors,
        Column,
        Divider,
        ElevatedButton,
        IconButton,
        Icons,
        Image,
        InputDecoration,
        MainAxisSize,
        MaterialPageRoute,
        OutlineInputBorder,
        Scaffold,
        State,
        StatefulWidget,
        TextButton,
        TextField,
        Widget,
        showDialog;
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obbeye = true;

  void showPassword() {
    setState(() {
      obbeye = !obbeye;
    });
  }

  Widget logo() {
    return Image.asset("images/logo.png", width: 180, height: 180);
  }

  Widget showText() {
    return Text(
      "BCSP6A Shopping Mall",
      style: TextStyle(
        color: Colors.amber.shade900,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontFamily: "Lobster",
      ),
    );
  }

  Widget UsernameText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green.shade800,
            size: 30,
          ),
          labelText: 'User name',
        ),
      ),
    );
  }

  Widget PasswordText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      child: TextField(
        obscureText: obbeye,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.lock, color: Colors.green.shade800, size: 30),
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              showPassword();
            },
            icon: Icon(
              obbeye ? Icons.visibility_off : Icons.visibility,
              size: 30,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        MaterialPageRoute route = MaterialPageRoute(
          builder: (c) => MenuHomePage(),
        );
        Navigator.of(context).push(route);
      },
      child: Text(
        "Log In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lobster',
        ),
      ),
    );
  }

  Widget SignupButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (c) {
            return AlertDialog(
              title: Text("ປ້ອນຂໍ້ມູນສ່ວນຕົວ"),
              content: Text(
                "ລາຍລະອຽດຂໍ້ມູນສ່ວນຕົວ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              actions: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.person_off_outlined,
                      size: 25,
                      color: Colors.green,
                    ),
                    labelText: "ປ້ອນລະຫັດ",
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.person_add_alt,
                      size: 25,
                      color: Colors.green,
                    ),
                    labelText: "ຊື່",
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.family_restroom,
                      size: 25,
                      color: Colors.green,
                    ),
                    labelText: "ນາມສະກຸນ",
                  ),
                ),

                Divider(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.person_3_outlined,
                      size: 25,
                      color: Colors.green,
                    ),
                    labelText: "ຊື່ຜູ້ໃຊ້ລະບົບ",
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.key_off,
                      size: 25,
                      color: Colors.green,
                    ),
                    labelText: "ລະຫັດຜ່ານ",
                  ),
                ),
                Divider(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("ບັນທຶກແລ້ວ");
                      },
                      child: Text("ບັນທຶກ"),
                    ),
                    SizedBox(width: 25),
                    // Divider(),
                    TextButton(
                      onPressed: () {
                        print("ຍົກເລີກແລ້ວ");
                      },
                      child: Text("ຍົກເລີກ"),
                    ),
                  ],
                ),
                Divider(),
              ],
            );
          },
        );
      },
      child: Text(
        "Sign up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lobster',
        ),
      ),
    );
  }

  Widget LoginSignupButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [LoginButton(), SizedBox(width: 15), SignupButton()],
    );
  }

  // widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.green],
            radius: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              logo(),
              showText(),
              SizedBox(height: 25),
              UsernameText(),
              SizedBox(height: 15),
              PasswordText(),
              SizedBox(height: 15),
              LoginSignupButton(),
            ],
          ),
        ),
      ),
    );
  }
}
