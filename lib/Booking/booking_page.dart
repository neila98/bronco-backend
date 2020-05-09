//import 'package:flight/ticket_card.dart';
import 'package:bronco2/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:bronco2/Booking/ticket_card.dart';
import 'flight_stop_ticket.dart';
import 'package:bronco2/Payment/boardingPass.dart';

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

class BookingPage extends StatefulWidget{
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with TickerProviderStateMixin{

  List<FlightStopTicket> stops = [
    new FlightStopTicket("Boston", "BOS", "Kuala Lumpur", "KUL", "KU2342", "24 June 2019"),
    new FlightStopTicket("Kuala Lumpur", "KUL", "Boston", "BOS", "KU2341", "24 June 2019"),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed:(){
              //navigateToFlightSUmmary(context);
              //navigateToBoardingPass(context);
              navigateToSettings(context);
            }
        ),
        title: Text(
          'My Booking',
          style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff21254A),
          ),
        resizeToAvoidBottomInset: true,
         backgroundColor: Color(0xff21254A),
      body: new Stack(

        children: <Widget>[


          Positioned.fill(
              top: MediaQuery.of(context).padding.top+64.0,
              child: SingleChildScrollView(
                child: new Column(
                  children: _buildTickets().toList(),
                  
                ),
              ))
        ],

      ),
      /*floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }
  Iterable<Widget> _buildTickets(){
    return stops.map((stop){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: TicketCard(stop: stop),
      );
    });
  }

  /*_buildFab(){
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pop(),
      child: new Icon(Icons.navigate_next),
    );
  }*/


}
Future navigateToBoardingPass(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => BoardingPass()));
}