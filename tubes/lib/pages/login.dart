import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tubes/auth/auth_repo.dart';
import 'package:tubes/bloc/login/login_cubic.dart';
import 'package:tubes/pages/homescreen.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';
import 'package:tubes/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Loading..')));
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ));
        }
        if (state is LoginSuccess) {
          //context.read<AuthCubit>().loggedIn();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.green,
            ));
          Navigator.pushNamedAndRemoveUntil(context, rHome, (route) => false);
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
                  'LOGIN',
                  style: heading1.copyWith(color: txtColor1),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
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
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<LoginCubit>()
                      .login(email: emailEdc.text, password: passEdc.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("Login", style: txtbtn.copyWith(color: bgColor2))),
            SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    signInWithGoogle();
                  },
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don`t have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Sign up",
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
