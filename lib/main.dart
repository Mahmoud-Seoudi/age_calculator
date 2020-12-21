import 'package:calc_age/age.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var myController = TextEditingController();
  int birhtYear = 0;
  String result = 'Your Age is : 0';
  var mainColor = Colors.blueAccent[200];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'Age Calculator',
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 20.0),
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                    labelText: 'Birth Year',
                    hintText: 'Enter your year of birth !',
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                result,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (myController.text.isNotEmpty) {
                      int birth = int.parse(myController.text);
                      if (birth <= DateTime.now().year) {
                        AgeCalculator(birth);
                        birhtYear = AgeCalculator.age;
                        result = 'Your Age is : $birhtYear';
                      } else {
                        result = 'Invalid year, Try again!';
                      }
                    } else {
                      birhtYear = 0;
                      result = 'Your Age is : $birhtYear';
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: mainColor,
                splashColor: Colors.red,
                child: Text(
                  'Get Age',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
