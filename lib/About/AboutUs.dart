import 'package:flutter/material.dart';
//import 'package:bronco2/Settings/settings.dart';

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

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // var _color = Color(0xff21254A);
  // var _iconColor = Colors.deepPurple;
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
          "About Us",
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
              Center(
                child: Container(
                  width: 400.0,
                  height: 600.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 30.0,
                              ),
                              ListTile(
                                leading: Icon(Icons.airplanemode_active),
                                title: Text(
                                  'Bronco Airline is a Malaysian airline company hearquartered in Universiti Teknologi Malaysia, Johor. Bronco Airline operates scheduled domestic and international flights to more than 100 destinations',
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
                                  'Bronco Airlines started our operations as an official carrier for UTM on 1 January 2000. We are known with an outstanding and warm hospitality.',
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
                                  'This airline represents the diversity of UTM that synchronize with UTMs core values: Integrity, Synergy, Excellence and Sustainability.',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              )
                            ],
                          ),
                        ),
                      ],
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
