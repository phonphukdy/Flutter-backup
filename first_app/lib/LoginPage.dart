import 'package:first_app/MenuHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Colors,
        Column,
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
        TextField,
        Widget;
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
      onPressed: () {},
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
