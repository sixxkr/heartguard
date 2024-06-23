import 'package:flutter/material.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor2,
        child: ListView(children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'Profile',
              style: heading1.copyWith(color: txtColor1),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Email',
            style: heading2.copyWith(color: txtColor1),
          ),
          TextFormField(
            controller: emailEdc,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Password',
            style: heading2.copyWith(color: txtColor1),
          ),
          TextFormField(
            controller: passEdc,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    passInvisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    passInvisible = !passInvisible;
                  });
                },
              ),
            ),
            obscureText: !passInvisible,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Password',
            style: heading2.copyWith(color: txtColor1),
          ),
          TextFormField(
            controller: passEdc,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    passInvisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    passInvisible = !passInvisible;
                  });
                },
              ),
            ),
            obscureText: !passInvisible,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text("Edit Profile",
                  style: txtbtn.copyWith(color: bgColor2))),
        ]),
      ),
    );
  }
}
