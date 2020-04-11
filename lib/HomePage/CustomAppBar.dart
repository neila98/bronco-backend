import 'package:flutter/material.dart';

class CustomAppBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.white);

  CustomAppBottomBar() {
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
        icon: new Icon(
          Icons.book,
          color: Colors.white,
        ),
        title: Text(
          "My Bookings",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );

    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.directions_run,
          color: Colors.white,
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
