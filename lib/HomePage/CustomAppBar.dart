import 'package:bronco2/Booking/booking_page.dart';
import 'package:bronco2/screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomAppBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.white);

  CustomAppBottomBar(BuildContext context) {
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.flight,
        color: Colors.white,
      ),
      title: Text(
        "Search Flight",
        style: bottomNavigationBarItemStyle.copyWith(color: Colors.pink[200]),
      ),
    ));
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: FlatButton(
          child: new Icon(
            Icons.book,
            color: Colors.white,
          ),
          onPressed: () {
            FirebaseAuth.instance
                .signOut()
                .then((result) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookingPage())))
                .catchError((err) => print(err));
          },
        ),
        title: Text(
          "My Bookings",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );

    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: FlatButton(
          child: new Icon(
            Icons.directions_run,
            color: Colors.white,
          ),
          onPressed: () {
            FirebaseAuth.instance
                .signOut()
                .then((result) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())))
                .catchError((err) => print(err));
          },
        ),
        title: Text(
          "Logout",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        backgroundColor: Color(0xff21254A),
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
