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

class TravelInfo extends StatefulWidget {
  @override
  _TravelInfoState createState() => _TravelInfoState();
}

class _TravelInfoState extends State<TravelInfo> {
  var _appBarColor = Color(0xff21254A);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "COVID-19 TRAVEL INFORMATON",
          textAlign: TextAlign.center,
        ),
        backgroundColor: _appBarColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [firstColor, secondColor])),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: Container(
                    width: 500.0,
                    height: 600.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            color: Colors.white,
                            margin:
                                const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.airplanemode_active),
                                  title: Text(
                                    'In regards to the latest COVID-19 outbreak, Bronco Airlines is providing extra measures to ensure our customers safety and peace-of-mind. Please refer to the following links for more information on travel restrictions, ticket refunds and more. \n',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                ListTile(
                                  leading: Icon(Icons.airplanemode_active),
                                  title: Text(
                                    'Bronco Airlines understands the concerns of customers on travel and restrictions due to COVID-19. Our offer of extended flexibility allows you to rebook your travel by 31 December and travel by 30 June 2021. Please contact us atleast 72 hours before your trip for cancelation and modification of your booking. ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
