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

class ProductService extends StatefulWidget {
  @override
  _ProductServiceState createState() => _ProductServiceState();
}

class _ProductServiceState extends State<ProductService> {
 // var _color = Color(0xff21254A);
 // var _iconColor = Colors.deepPurple;
  var _appBarColor = Color(0xff21254A);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
           onPressed:(){
             Navigator.pop(context);
           } 
           ),
          title: Text(
            "Products and Service",
            textAlign: TextAlign.center,
          ),
          backgroundColor: _appBarColor,
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor])
          ),
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
                          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.airplanemode_active),
                                title: Text(
                                  'As the UTMs official airline, Bronco has embraced the UTMs initiative to be the global prominence as an holistic, innovative and entrepreneural academia.',
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
                                  'The airlines fleet consists of twenty airbus that covers 50 destinations around the globe. The airlines operates with three class layout: Economy, Business and First. Bronco Airlines also offers inflight WiFi, premium cabin class seats, fine dining services, top notch inflight entertainment, generous baggage allowance and premium check-in services.',
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
          ],),
        ),
        
      
      
    );
  }
}