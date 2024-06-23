import numpy as np
from flask import Flask, json, request, render_template,jsonify
import joblib

# Create flask app
flask_app = Flask(__name__)
model = joblib.load(open("heart_model_predict_rf.pkl", "rb"))

@flask_app.route("/")
def Home():
    return render_template("index.html")

@flask_app.route("/predict/api", methods = ["POST"])
def predict_api():
    data1 = request.json['age']
    data2 = request.json['sex']
    data3 = request.json['cp']
    data4 = request.json['trtbps']
    data5 = request.json['chol']
    data6 = request.json['fbs']
    data7 = request.json['restecg']
    data8 = request.json['thalachh']
    data9 = request.json['exng']
    data10 = request.json['oldpeak']
    data11 = request.json['slp']
    data12 = request.json['caa']
    data13= request.json['thall']
    arr = np.array([[data1, data2, data3, data4,data5,data6,data7,data8,data9,data10,data11,data12,data13]])

    # float_features = [float(x) for x in request.form.values()]
    # arr = [np.array(float_features)]


    pred = model.predict(arr)
    result = ""
    if pred >= 0.5 :
        result =  "You have more chance to get heart attack"
    else :
        result ="You have less chance to get heart attack"

    return result
    
    
@flask_app.route("/predict", methods = ["POST"])
def predict():
    pred = predict_api()
    pred = pred.response

    return render_template("index.html", prediction_text = "u have heart dieses {}".format(pred[0].decode('utf8')))

if __name__ == "__main__":
    flask_app.run(debug=True)
    
    