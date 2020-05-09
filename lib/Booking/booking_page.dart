//import 'ticket_card (1).dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
//import 'flight_stop_ticket.dart';

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

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
 /* List<FlightStopTicket> stops = [
    new FlightStopTicket(
        "Johor Bahru", "JHB", "Kuala Lumpur", "KUL", "KU2342", "12 Aug 2020"),
    new FlightStopTicket(
        "Kuala Lumpur", "KUL", "Penang", "PEN", "KU2341", "17 Nov 2020"),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: firstColor,
        backgroundColorEnd: secondColor,
        elevation: 10.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Color(0xff21254A),
            onPressed: () {
              //navigateToFlightSummary(context);
            }),
        title: Text(
          'My Bookings',
          style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff21254A)),
        ),
        centerTitle: true,
        //backgroundColor: Color(0xff21254A),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff21254A),
      body: new Stack(
        children: <Widget>[
          Positioned.fill(
              top: MediaQuery.of(context).padding.top + 64.0,
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

  Iterable<Widget> _buildTickets() {
    /*return stops.map((stop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
       // child: TicketCard(stop: stop),
      );
    });*/
  }

  /*_buildFab(){
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pop(),
      child: new Icon(Icons.navigate_next),
    );
  }*/

}
