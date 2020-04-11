import 'dart:async';

//import 'package:bronco2/screens/LoginPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   Timer(
    //     Duration(seconds: 6),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => LoginPage())));

    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 51, 1),
        body: Container(
          child: Stack(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage("assets/images/4.gif"),
              fit: BoxFit.cover,
            ))),
            Positioned(
                left: 150,
                top: 300,
                child: Container(
                    width: 100,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Color.fromRGBO(190, 166, 98, 1),
                        image: DecorationImage(
                          image: AssetImage('assets/images/3.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )))
          ]),
        ));
  }
}
