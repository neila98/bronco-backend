import 'package:bronco2/Booking/booking_page.dart';
import 'package:bronco2/Payment/boardingPass.dart';
import 'package:flutter/cupertino.dart';
import 'flight_stop_ticket.dart';
import 'package:bronco2/Booking/flight_stop_ticket.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  get context => stop;

  TicketCard createState() => new TicketCard();
  const TicketCard({Key key, this.stop}) : super(key: key);
  final FlightStopTicket stop;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: new ObjectKey(stop),
        child: new Card(
            elevation: 10.0,
            margin: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                navigateToBoardingPass(context);
              },
              child: _buildCardContent(),
            )),
        confirmDismiss: (DismissDirection dismissDirection) async {
          switch (dismissDirection) {
            case DismissDirection.startToEnd:
              return await _showConfirmationDialog(context, 'delete') == true;
            case DismissDirection.horizontal:
            case DismissDirection.vertical:
            case DismissDirection.up:
            case DismissDirection.down:
              assert(false);
          }
          return false;
        });
  }

  Container _buildCardContent() {
    TextStyle airportName =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);

    TextStyle airportShortName =
        new TextStyle(fontSize: 36.0, fontWeight: FontWeight.w200);

    TextStyle flightNum =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

    TextStyle flightDate =
        new TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500);

    return Container(
      height: 180.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: () {
                        navigateToBoardingPass(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(stop.from, style: airportName),
                            ),
                            Text(stop.fromShort, style: airportShortName),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(stop.date, style: flightDate),
                            )
                          ],
                        ),
                      ))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 5.0),
                    child: Icon(
                      Icons.airplanemode_active,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Text(stop.flightNumber, style: flightNum),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(stop.to, style: airportName),
                      ),
                      Text(stop.toShort, style: airportShortName),
                      Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: new Text('Swipe to Cancel Booking',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.0,
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future navigateToBoardingPass(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BoardingPass()));
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(49, 39, 79, 1),
          title: Text('Do you confirm to cancel this booking?',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }
}
