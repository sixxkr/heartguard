import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/pages/login.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 15), () => Navigator.pushNamed(context, '/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor1.withOpacity(1),
        child: Column(children: [
          SizedBox(
            height: 130,
            width: 324,
          ),
          Text(
            'Heart Guard',
            style: heading1.copyWith(color: txtColor1),
          ),
          SizedBox(
            height: 40,
          ),
          SafeArea(
            child: Image(
              image: AssetImage('assets/images/heart.png'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}
