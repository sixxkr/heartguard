import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubes/bloc/register/register_cubic.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';
import 'package:tubes/utils/routes.dart';
import 'package:tubes/auth/auth_repo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Loading..')));
        }
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ));
        }
        if (state is RegisterSuccess) {
          // context.read<AuthCubit>().loggedIn(); ScaffoldMessenger.of(context) ..hideCurrentSnackBar() ..showSnackBar(SnackBar( content: Text(state.msg), backgroundColor: Colors.green, )); Navigator.pushNamedAndRemoveUntil( context, rLogin, (route) => false);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        color: bgColor2.withOpacity(1),
        child: ListView(
          children: [
            Container(
              child: Column(children: [
                Text(
                  'SIGN UP',
                  style: heading1.copyWith(color: txtColor1),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
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
              'Confirm Password',
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
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<RegisterCubit>()
                    .register(email: emailEdc.text, password: passEdc.text);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text("Register", style: txtbtn.copyWith(color: bgColor2)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/icons/google.png'),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/icons/facebook.png'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login  `",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: bgColor1),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
