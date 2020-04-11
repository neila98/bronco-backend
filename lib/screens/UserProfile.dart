import 'package:flutter/material.dart';
import 'package:bronco2/Settings/settings.dart';

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

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 350.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [secondColor, firstColor]),
                    )),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [secondColor, firstColor]),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      navigateToSettings(context);
                    },
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 100.0,
                  left: 15.0,
                  right: 15.0,
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          gradient: LinearGradient(
                              colors: [firstColor, secondColor])),
                    ),
                  ),
                ),
                Positioned(
                  top: 55.0,
                  left: (MediaQuery.of(context).size.width / 2 - 50.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Color.fromRGBO(33, 37, 74, 1),

                      //image: DecorationImage(
                      //folder images baru
                      // image: AssetImage('assets/profile.jpg'),
                      //   fit: BoxFit.cover)
                    ),
                  ),
                ),
                Positioned(
                  top: 170.0,
                  left: (MediaQuery.of(context).size.width / 2) - 105.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CXXXX PXXXXXX',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        'W E L C O M E',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            color: Color.fromRGBO(33, 37, 74, 1),
                            onPressed: () {},
                            child: Text(
                              'Member ID',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            color: Color.fromRGBO(33, 37, 74, 1),
                            onPressed: () {},
                            child: Text(
                              'Points',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                menuCard('Email', 'bxxxx@gmail.com'),
                SizedBox(height: 12.0),
                menuCard('Contact Number', '+601 XXXXXXXX'),
                SizedBox(height: 12.0),
                menuCard('Password', 'XXXXXXXX'),
              ],
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                getProfile('Personal Info', 'NXXXXX NXXXXXX', 'Date of Birth',
                    '08/04/2020'),
                SizedBox(height: 12.0),
                getProfile('Country', 'MALAYSIA', 'Address',
                    '37A JALAN JPS KG SKUDAI'),
                SizedBox(height: 12.0),
                getProfile(
                    'Passport Number', 'AXXXXXXXX', 'Expires', '10/06/2020'),
                SizedBox(height: 12.0),
                getProfile('Emergency Contact', '+601 XXXXXXXX', 'Relationship',
                    'Relative'),
              ],
            ),
            SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Family and Friends',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ));
  }

  Widget getProfile(String title, String type, String title1, String type1) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    type,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    title1,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    type1,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuCard(String title, String type) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    type,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future navigateToSettings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
}
