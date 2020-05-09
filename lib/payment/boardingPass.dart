import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:bronco2/Payment/InsertPayment.dart';
import 'package:bronco2/Payment/flightSummary.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

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

class BoardingPass extends StatefulWidget {
  @override
  _BoardingPassState createState() => _BoardingPassState();
}

class _BoardingPassState extends State<BoardingPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
           onPressed:(){
             navigateToHomePage(context);
           } 
           ),
        title: Text(
          'Boarding Pass',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff21254A),
      ),
      backgroundColor: Color(0xff21254A),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
           
            Center(
              child: FlutterTicketWidget(
          width: 350.0, 
          height: 500.0, 
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          width:1.0,
                          color: Colors.green ),
                      ),
                      child: Center(
                        child: Text(
                          'Business Class',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'KUA',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.flight_takeoff,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'JHB',
                            style: TextStyle(
                             color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:
                    Center(
                      child: Container(
                        width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/flight.png'),
                          fit: BoxFit.cover)
                        ),
                      ),
                    ),
                   /*Text(
                    'Flight Ticket',
                    
                  ),*/
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetails(
                        'Passengers', 'Nabiha Rizalman', 'Date', '24-12-2020'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 40.0
                        ),
                        child: ticketDetails(
                          'Flight','BH122','Gate','C2'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 40.0
                        ),
                        child: ticketDetails(
                          'Class','Business','Seat','D7'
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 30.0,
                    right: 30.0
                  ),
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/barcode.png'),
                        fit: BoxFit.cover)
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),

            ),
            SizedBox(
              height: 10.0,
            ),

            Text(
              'For assistance please go to the help desk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),    
    );
  }
                      
  Widget ticketDetails(String firstTitle, String firstDesc, String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
Future navigateToFlightSUmmary(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FlightSummary()));
}