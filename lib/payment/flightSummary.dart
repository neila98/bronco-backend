import 'package:flutter/material.dart';
import 'package:bronco2/Payment/animatedPay.dart';
import 'package:bronco2/HomePage/HomePage.dart';
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

class FlightSummary extends StatefulWidget {
  @override
  _FlightSummaryState createState() => _FlightSummaryState();
}

class _FlightSummaryState extends State<FlightSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
           onPressed:(){
             navigateToFlightList(context);
           } 
           ),
        title: Text(
          'Booking Summary',
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
          decoration: BoxDecoration(
            gradient:
            LinearGradient(colors: [firstColor, secondColor])
            ),
               
          child: ListView(
            children: <Widget>[
        SizedBox(height: 50.0),
         Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Fares, taxes and fees',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,),
              ),
              
            ],
          ),
        ),
        SizedBox(height: 12.0),
        Column(
          children: <Widget>[
          
            SizedBox(height: 12.0),
            getSummary('Depart Date' , '24 JUNE 2020' , 'Depart Total' ,'599.00 MYR' ),
            //SizedBox(height: 12.0),
            //getSummary('Return Date','08 JUL 2020' , 'Return Total' , '209.00 myr'),
           
          ],
        ),
  
        SizedBox(height: 100.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total MYR',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '599.00',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        SizedBox(height: 30.0,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 20.0),
                  child: new Text(
                    "Proceed",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  color: Color(0xff21254A),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => PayConfirmation()));
                    
                  },
            ),
        ),
      ],
      ),
      
    )
    );
  }

  Widget getSummary(String title, String type, String title1, String type1){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
            //gradient: LinearGradient(colors:[firstColor, secondColor]),
            borderRadius: BorderRadius.circular(7.0), color: Colors.white,
            ),
              
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
 
 
}
Future navigateToPayConfirmation(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => PayConfirmation()));
}
Future navigateToHomePage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}
Future navigateToFlightList(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FlightList()));
}