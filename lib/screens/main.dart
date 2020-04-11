import 'package:flutter/material.dart';
import 'package:bronco2/splash/splash.dart';

void main() => runApp(Bronco2());

class Bronco2 extends StatefulWidget {
  @override
  _Bronco2 createState() => _Bronco2();
}

class _Bronco2 extends State<Bronco2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // theme: appTheme,
    );
  }
}
