import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';
import 'package:http/http.dart' as http;

class HeartCheck extends StatefulWidget {
  const HeartCheck({Key? key}) : super(key: key);
  @override
  State<HeartCheck> createState() => _Heartcheck();
}

class _Heartcheck extends State<HeartCheck> {
  String? body = "";
  final age = TextEditingController();
  final sex = TextEditingController();
  final cp = TextEditingController();
  final trtbps = TextEditingController();
  final chol = TextEditingController();
  final fbs = TextEditingController();
  final restecg = TextEditingController();
  final thalachh = TextEditingController();
  final exng = TextEditingController();
  final oldpeak = TextEditingController();
  final slp = TextEditingController();
  final caa = TextEditingController();
  final thall = TextEditingController();

  Future Predict(
    var age,
    var sex,
    var cp,
    var trtbps,
    var chol,
    var fbs,
    var restecg,
    var thalachh,
    var exng,
    var oldpeak,
    var slp,
    var caa,
    var thall,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map<String, int> msg = {
      'age': age,
      'sex': sex,
      'cp': cp,
      'trtbps': trtbps,
      'chol': chol,
      'fbs': fbs,
      'restecg': restecg,
      'thalachh': thalachh,
      'exng': exng,
      'oldpeak': oldpeak,
      'slp': slp,
      'caa': caa,
      'thall': thall,
    };

    var response = await http.post(
      Uri.parse("http://10.0.2.2:5000/predict/api"),
      body: jsonEncode(msg),
      headers: requestHeaders,
    );

    setState(() {
      body = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: bgColor2,
      child: ListView(children: [
        SizedBox(height: 5),
        Center(
          child: Text(
            'HeartCheck',
            style: heading1.copyWith(color: txtColor1),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Age',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'Masukkan Umur',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: age,
        ),
        SizedBox(height: 20),
        Text(
          'Jenis Kelamin',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: '1 laki laki -  0 perempuan',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: sex,
        ),
        SizedBox(height: 20),
        Text(
          'Chest Pain',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'Chest Pain 1-4',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: cp,
        ),
        SizedBox(height: 20),
        Text(
          'resting blood pressure',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'Masukkan resting blood pressure',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: trtbps,
        ),
        SizedBox(height: 20),
        Text(
          'Cholestoral',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'Masukkan  cholestoral',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: chol,
        ),
        SizedBox(height: 20),
        Text(
          'fasting blood sugar',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText:
                  'fasting blood sugar &gt; 120 mg/dl) (1 = true; 0 = false)',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: fbs,
        ),
        SizedBox(height: 20),
        Text(
          'resting electrocardiographic',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'resting electrocardiographic results 0-2',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: restecg,
        ),
        SizedBox(height: 20),
        Text(
          'maximum heart rate achieved',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'maximum heart rate achieved ',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: thalachh,
        ),
        SizedBox(height: 20),
        Text(
          'exang',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'exercise induced angina (1 = yes; 0 = no)',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: exng,
        ),
        SizedBox(height: 20),
        Text(
          'oldpeak',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'ST depression induced by exercise relative to rest',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: oldpeak,
        ),
        SizedBox(height: 20),
        Text(
          'slp',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'the slope of the peak exercise ST segment',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: slp,
        ),
        SizedBox(height: 20),
        Text(
          'ca',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: 'number of major vessels (0-3) colored by flourosopy',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: caa,
        ),
        SizedBox(height: 20),
        Text(
          'thall',
          style: heading2.copyWith(color: txtColor1),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              hintText: '1 = normal; 2 = fixed defect; 3 = reversable defect',
              hintStyle: txtshadow.copyWith(color: txtshadowlogin)),
          controller: thall,
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: () => Predict(
              int.parse(age.text),
              int.parse(sex.text),
              int.parse(cp.text),
              int.parse(trtbps.text),
              int.parse(chol.text),
              int.parse(fbs.text),
              int.parse(restecg.text),
              int.parse(thalachh.text),
              int.parse(exng.text),
              int.parse(oldpeak.text),
              int.parse(slp.text),
              int.parse(caa.text),
              int.parse(thall.text)),
          child: Text("Predict", style: txtbtn.copyWith(color: bgColor2)),
          style: TextButton.styleFrom(
              backgroundColor: bgColor1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 30,
        ),
        Center(child: LayoutBuilder(builder: (context, constraints) {
          if (body! == "You have more chance to get heart attack") {
            return Text(
              body!,
              style: txtshadow.copyWith(color: txtHasilMerah),
            );
          } else if (body! == "You have less chance to get heart attack") {
            return Text(
              body!,
              style: txtshadow.copyWith(color: txtHasilHijau),
            );
          } else {
            return Text(
              body!,
              style: txtshadow.copyWith(color: txtshadowheart),
            );
          }
        })),
        SizedBox(
          height: 50,
        ),
      ]),
    ));
  }
}
