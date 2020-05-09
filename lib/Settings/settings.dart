import 'package:bronco2/screens/LoginPage.dart';
import 'package:bronco2/screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:bronco2/Booking/booking_page.dart';
import 'package:bronco2/HomePage/CustomShapeClipper.dart';

Color firstColor = Color.fromRGBO(
  242,
  152,
  152,
  1,
);
Color secondColor = Color.fromRGBO(
  209,
  159,
  228,
  1,
);

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff21254A),
        body: Column(
          children: <Widget>[
            Top(),
            below,
          ],
        ));
  }
}

class Top extends StatefulWidget {
  @override
  _Top createState() => _Top();
}

class _Top extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
                height: 430.0,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [firstColor, secondColor])),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () => navigateToHomePage(context),
                              //{

                                //Navigator.pop(context);
                              //},
                              color: Colors.black,
                            ),
                          ),
                          Text('Settings',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color(0xff21254A),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                          SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            margin: const EdgeInsets.all(8.0),
                            color: Color.fromRGBO(33, 37, 74, 0.5),
                            child: ListTile(
                              onTap: () {
                                navigateToProfile(context);
                              }, //go to profile
                              title: Text("My Profile",
                                  style: TextStyle(color: Colors.white)),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                              trailing: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          
                          Card(
                            margin:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.book,
                                      color: Color.fromRGBO(33, 37, 74, 1)),
                                  title: Text("My Bookings"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () => navigateToBookings(context), //go to change password
                                ),
                                Container(
                                    width: double.infinity,
                                    height: 1.0,
                                    color: Color.fromRGBO(33, 37, 74, 1)),
                                ListTile(
                                  leading: Icon(Icons.keyboard,
                                      color: Color.fromRGBO(33, 37, 74, 1)),
                                  title: Text("Change Username"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {}, //go to change password
                                ),
                                Container(
                                    width: double.infinity,
                                    height: 1.0,
                                    color: Color.fromRGBO(33, 37, 74, 1)),
                                ListTile(
                                  leading: Icon(Icons.settings_power,
                                      color: Color.fromRGBO(33, 37, 74, 1)),
                                  title: Text("Logout"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () => showAlertDialog(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}

var below = Column(children: <Widget>[
  Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 32.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text("About Us",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.pink[100],
            )),
        SizedBox(height: 10),
      ],
    ),
  ),
  SizedBox(
    height: 20,
  ),
  Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.card_travel,
                        color: Color.fromRGBO(33, 37, 74, 1)),
                    title: Text("About Us"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {}, //go to change password
                  ),
                  Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Color.fromRGBO(33, 37, 74, 1)),
                  ListTile(
                    leading: Icon(Icons.flight_land,
                        color: Color.fromRGBO(33, 37, 74, 1)),
                    title: Text("Products and Services"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {}, //go to change password
                  ),
                  Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Color.fromRGBO(33, 37, 74, 1)),
                  ListTile(
                    leading: Icon(Icons.flight_takeoff,
                        color: Color.fromRGBO(33, 37, 74, 1)),
                    title: Text("Travel Information"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {}, //go to change password
                  ),
                ],
              ),
            ),
          ]))
]);

Future navigateToProfile(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => UserProfile()));
}

Future navigateToSettings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
}

Future navigateToLogin(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      navigateToSettings(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      navigateToLogin(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Leaving so soon?"),
    content: Image.asset("assets/images/leave.gif"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
Future navigateToBookings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()));
}