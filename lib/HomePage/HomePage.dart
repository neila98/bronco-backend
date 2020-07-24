import 'dart:async';
import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';
import 'package:bronco2/HomePage/CustomAppBar.dart';
import 'package:bronco2/Settings/settings.dart';
import 'package:bronco2/screens/flightList.dart';

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

List<String> toLocations = [
  'Kuala Lumpur (KUL)',
  'Boston (BOS)',
  'New York City (JFK)'
];
List<String> fromLocations = ['Boston (BOS)', 'New York (JFK)'];

List<CityCard> cityCards = [
  CityCard("assets/images/sabah.jpg", "Sabah", "Aug 2020", "30", "250", "175"),
  CityCard("assets/images/singapore.jpg", "Singapore", "Nov 2020", "50", "300",
      "150"),
  CityCard(
      "assets/images/iceland.jpg", "Iceland", "Jan 2021", "50", "4299", "2149"),
  CityCard("assets/images/australia.jpg", "Sydney", "Feb 2021", "40", "2999",
      "1799"),
];

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomAppBottomBar(context),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff21254A),
        body: Column(
          children: <Widget>[
            FirstSection(),
            secondSection,
          ],
        ));
  }
}

class FirstSection extends StatefulWidget {
  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with SingleTickerProviderStateMixin {
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
                height: 320.0,
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
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Color(0xff21254A),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          PopupMenuButton(
                              onSelected: (index) {
                                setState(() {
                                  selectedLocationIndex = index;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    fromLocations[selectedLocationIndex],
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff21254A),
                                  ),
                                ],
                              ),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                    PopupMenuItem(
                                      child: Text(
                                        fromLocations[0],
                                      ),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text(
                                        fromLocations[1],
                                      ),
                                      value: 1,
                                    ),
                                  ]),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.settings),
                            color: Color(0xff21254A),
                            onPressed: () {
                              navigateToSettings(context);
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text('Where is your \n next destination?',
                        style:
                            TextStyle(fontSize: 24.0, color: Color(0xff21254A)),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: TextField(
                              controller:
                                  TextEditingController(text: toLocations[0]),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 14.0),
                                suffixIcon: Material(
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FlightList()));
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: Color(0xff21254A),
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ))),
                  ],
                )))
      ],
    );
  }
}

var secondSection = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Explore Cities",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.pink[100],
              )),
          Spacer(),
          Text(
            "View All",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.pink[100],
            ),
          )
        ],
      ),
    ),
    Container(
      height: 240.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    )
  ],
);

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160.0,
                  width: 160.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  height: 90,
                  width: 160,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.01),
                        ])),
                  ),
                ),
                Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    right: 10.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink[100],
                                  fontSize: 18.0),
                            ),
                            Text(
                              monthYear,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.pink[200],
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              discount + "%",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            )),
                      ],
                    ))
              ],
            ),
          ),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "FROM RM" + (oldPrice),
                    style: TextStyle(
                        color: Colors.pink[100], fontWeight: FontWeight.normal),
                  ),
                ),
              ]),
          SizedBox(
            width: 5.0,
          ),
          Text("NOW RM" + (newPrice),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Future navigateToSettings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
}
