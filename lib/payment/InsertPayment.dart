import 'package:bronco2/Payment/boardingPass.dart';
import 'package:bronco2/services/card_data_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bronco2/Payment/addNewCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:bronco2/models/card_model.dart';

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

List<String> paymentMethod = [
  'Credit/Debit Cards',
  'Online Banking',
  'E-Wallet',
  'Cash'
];

class InsertPayment extends StatefulWidget {
  @override
  _InsertPaymentState createState() => _InsertPaymentState();
}

class _InsertPaymentState extends State<InsertPayment>
    with SingleTickerProviderStateMixin {
  //get newValue => ;
  //List<Card> allCard;
  List<Card> allCard;
  final dataService = CardDataService();

  String cardNum;
  String expiryDate;
  String cvv;
  String cardHolder;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(milliseconds: 0));
    // final id = await getId();
    final map =
        await Firestore.instance.collection('cards').document(cardHolder).get();
    print(map.data);

    setState(() {
      cardNum = map.data['cardNum'];
      expiryDate = map.data['expiryDate'];
      cvv = map.data['cvv'];
      cardHolder = map.data['cardHolder'];
    });
    return cardHolder;
  }

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Card>>(
      //future: dataService.getAllCard(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          allCard = snapshot.data;
          return _cardScreen();
        }
        return _cardScreen();
      },
    );
  }

  Scaffold _cardScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              navigateToFlightSUmmary(context);
            }),
        title: Text(
          'Payment',
          style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff21254A),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff21254A),
      body: Container(
        //height: 430.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total MYR',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '599.00',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient:
                          LinearGradient(colors: [firstColor, secondColor]),
                    ),
                    color: Colors.pinkAccent[150],
                    child: ListTile(
                      title: Text('Pay with',
                          style: TextStyle(color: Colors.black)),
                      leading: Icon(
                        Icons.payment,
                        color: Colors.purple[400],
                      ),
                      trailing: DropdownButton(
                          value: 0,
                          items: [
                            DropdownMenuItem(
                              child: Text(paymentMethod[0]),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text(paymentMethod[1]),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text(paymentMethod[2]),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text(paymentMethod[3]),
                              value: 3,
                            ),
                          ],
                          onChanged: (newValue) {
                            paymentMethod[index] = newValue;
                            setState(() {});
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 15,
                    child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 200,
                                ),
                                Image.asset(
                                  'assets/images/visa.png',
                                  width: 80.0,
                                  //alignment: Alignment.topRight,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                      //'**** **** **** 3484',
                                      cardNum ?? "Loading...",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Card Holder',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Text(
                                          //'Amelia Rose',
                                          cardHolder ?? "Loading...",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 120,
                                        ),
                                        Text(
                                          'Expires',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Text(
                                          //'02/2023',
                                          expiryDate ?? "Loading...",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'CVV',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Text(
                                          //'213',
                                          cvv ?? "Loading...",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          onPressed: () {
                            navigateToCardForm(context);
                          },
                          child: Text(
                            'Add New Card',
                            style: TextStyle(
                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color.fromRGBO(33, 37, 74, 1),
                            ),
                          ),
                          color: firstColor,
                          hoverColor: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          onPressed: () => showSnackBar(context),
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color.fromRGBO(33, 37, 74, 1),
                            ),
                          ),
                          color: secondColor,
                          hoverColor: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //);

}

void showSnackBar(BuildContext context) {
  Flushbar(
    mainButton: FlatButton(
      onPressed: () {
        navigateToTicket(context);
      },
      child: Text(
        'View Ticket',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(10),
    borderRadius: 8,
    backgroundGradient: LinearGradient(
      colors: [Colors.green.shade800, Colors.greenAccent.shade700],
      stops: [0.6, 1],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: 'Thank you!',
    message: 'Payment Successful',
    duration: Duration(seconds: 10),
  )..show(context);
}

//}
/*
Future navigateToHomePage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}*/
Future navigateToTicket(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => BoardingPass()));
}

Future navigateToCardForm(context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddNewCard(
                onCreditCardModelChange: (CreditCardModel) {},
              )));
}
