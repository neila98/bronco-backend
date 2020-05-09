import 'flight_stop_ticket.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  get context => null;

  @override
  TicketCard createState() => new TicketCard();

  final FlightStopTicket stop;

  const TicketCard({Key key, this.stop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          // navigate ke boarding pass
        },
        child: _buildCardContent(),
      ),
    );
  }

  Container _buildCardContent() {
    TextStyle airportName =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);

    TextStyle airportShortName =
        new TextStyle(fontSize: 36.0, fontWeight: FontWeight.w200);

    TextStyle flightNum =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

    TextStyle flightDate =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

    return Container(
      height: 150.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 25.0),
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
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
              padding: const EdgeInsets.only(left: 35.0, top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(stop.to, style: airportName),
                  ),
                  Text(stop.toShort, style: airportShortName),
                  Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: new FlatButton(
                        color: Colors.transparent,
                        onPressed: _showDialog,

                        child: Text('Cancel Booking',
                            style: TextStyle(
                              color: Colors.red,
                            )),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /*Future<bool> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to $action this item?'),
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
  }*/

  void _showDialog() {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
