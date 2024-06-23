import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String prediction;

  PostResult({required this.prediction});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(prediction: object['prediction']);
  }

  static Future<PostResult> connectTOAPI(
    String age,
    String sex,
    String cp,
    String trtbps,
    String chol,
    String fbs,
    String restecg,
    String thalachh,
    String exng,
    String oldpeak,
    String slp,
    String caa,
    String thall,
  ) async {
    String apiURL = "http://127.0.0.1:5000/predict/api";

    var apiresult = await http.post(apiURL as Uri, body: {
      "age": age,
      "sex": sex,
      "cp": cp,
      "trtbps": trtbps,
      "chol": chol,
      "fbs": fbs,
      "restecg": restecg,
      "thalachh": thalachh,
      "exng": exng,
      "oldpeak": oldpeak,
      "slp": slp,
      "caa": caa,
      "thall": thall,
    });
    var jsonObject = json.decode(apiresult.body);
    return PostResult.createPostResult(jsonObject);
  }
}
