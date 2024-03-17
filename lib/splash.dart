import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tekeleza/login.dart';
// import 'package:sdg_goals/bottomnav.dart';
// import 'package:sdg_goals/quiz_welcome.dart';
// import './auth/SignUp.dart';
// import './auth/redirector.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      (() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //builder: (context) => const SignUp(),
            // builder: (context) => Login(),
            builder: (context) => Login(
              onClickedSignUp: () {
                // Define a function here to handle sign-up action
              },
            ),
            //builder: (context) => quizWelcome(),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color(0xFF1A5377),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("./assets/images/bg1.jpg"), fit: BoxFit.cover),
        // ),
        width: width,
        height: height,
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Text(
                  "Tekeleza",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                Image.asset("assets/images/waterlogo.png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
