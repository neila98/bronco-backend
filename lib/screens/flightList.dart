import 'package:bronco2/HomePage/CustomShapeClipper.dart';
import 'package:bronco2/Settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:bronco2/Payment/flightSummary.dart';

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
final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          backgroundColorStart: firstColor,
          backgroundColorEnd: secondColor,
          title: Text(
            "Search Result",
            style: TextStyle(color: Color(0xff21254A)),
          ),
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff21254A),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xff21254A),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              FlightListFirstSection(),
              SizedBox(height: 20),
              FlightListSecondSection(),
            ],
          ),
        ));
  }
}

class FlightListFirstSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 200.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Boston(BOS)',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20.0,
                          ),
                          Text('Kuala Lumpur (KUL)',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.import_export,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class FlightListSecondSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Best Deals for Today",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          SizedBox(height: 10.0),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            height: 130.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [firstColor, secondColor]),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(color: Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('RM599',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text('RM899',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black54)),
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today, 'June 2019'),
                      //FlightDetailChip(Icons.flight_takeoff, 'Bronco Airlines'),
                      FlightDetailChip(Icons.star, '4.8'),
                      MaterialButton(
                      child: Column(
                        children: <Widget>[
                        Icon(Icons.payment),
                        Text(
                          'Buy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                      ),
                            //color: Color(0xff21254A),
                            onPressed: () {
                              navigateToFlightSUmmary(context);
                            },
                            
                          )
                    ],
                    
                  ),
                  
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                '55%',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: discountBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
        label: Text(label),
        labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
        backgroundColor: chipBackgroundColor,
        avatar: Icon(iconData, size: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ));
  }
}
Future navigateToFlightSUmmary(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FlightSummary()));
}