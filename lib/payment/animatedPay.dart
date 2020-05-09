//import 'package:bronco2/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:bronco2/Payment/InsertPayment.dart';

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

//animated
  class PayConfirmation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PayConfirmationState();
  }
}

  
  class PayConfirmationState extends State<PayConfirmation> {
  var data = "Confirm Your Tickets Now ?";
  var _alignment = Alignment.bottomCenter;
  var _color = Color(0xff21254A);
  var _iconColor = Colors.deepPurple;
  var _appBarColor = Color(0xff21254A);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
           onPressed:(){
            // navigateToFlightSUmmary(context);
           } 
           ),
          title: Text(
            "Payment Confirmation",
            textAlign: TextAlign.center,
          ),
          backgroundColor: _appBarColor,
          centerTitle: true,
        ),
        body: AnimatedContainer(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor])
          ),
          padding: EdgeInsets.only(bottom: 100.0),
          duration: Duration(seconds: 3),
          alignment: _alignment,
          child: Container(
            height: 35.0,
            child: Icon(
              Icons.airplanemode_active,
              color: _iconColor,
              size: 35.0,
            ),
          ),
          onEnd: ()
          {navigateToPayment(context);},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text(data),
          icon: Icon(Icons.airplanemode_active),
          backgroundColor: _color,
          //sini tamnah ke payment punya function
          
          onPressed: () {
            setState(() {
              //   _height == 200.0 ? _height = 30.0 : _height = 200.0;

              _alignment == Alignment.center
                  ? _alignment = Alignment.bottomCenter
                  : _alignment = Alignment.center;

              _alignment == Alignment.center
                  ? data = "Success . Ticket Confirm!!"
                  : data = "Confirm Your Tickets Now ?";

              _alignment == Alignment.center
                  ? _color = Colors.teal
                  : _color = Colors.blue;

              _alignment == Alignment.center
                  ? _appBarColor = Colors.teal
                  : _appBarColor = Colors.blue;

              _alignment == Alignment.center
                  ? _iconColor = Colors.teal
                  : _iconColor = Colors.blue;
                  
            });
          },
        ),
        
      ),
    );
  }
}
Future navigateToPayment(context) async
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => InsertPayment()));
}