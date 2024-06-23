import 'package:flutter/material.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor2,
        child: Column(children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              '“The first wealth is health”',
              style: heading2.copyWith(color: txtColor1),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Ralph Waldo Emerson',
              style: heading2.copyWith(color: txtColor1),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Heart Guard',
              style: heading1.copyWith(color: txtColor1),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: SafeArea(
              child: Image(
                image: AssetImage('assets/images/heart.png'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
