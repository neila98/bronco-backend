import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardList extends StatefulWidget {
  //get context => clist;
  @override
  _CardListState createState() => _CardListState();

  // const CardList({Key key, this.clist}) : super(key: key);
  //final Card clist;
}

class _CardListState extends State<CardList> {
  final FocusNode myFocusNode = FocusNode();
  var _appBarColor = Color(0xff21254A);
  //final Card clist;
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
          "Registered Card List",
          textAlign: TextAlign.center,
        ),
        backgroundColor: _appBarColor,
        centerTitle: true,
      ),
      body: //Dismissible(
          //key: new ObjectKey(context),
          //child:
          ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Text('Registered Card Number',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('cards').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.documents.map((doc) {
                      return ListTile(
                        title: Text(doc.data['cardNum']),
                        onLongPress: () =>
                            _showConfirmationDialog(context, 'delete'),
                      );
                    }).toList(),
                  );
                } else {
                  return SizedBox();
                }
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}

Future<bool> _showConfirmationDialog(BuildContext context, String action) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
        title: Text('Do you confirm to delete this card??',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            child: const Text('Yes'),
            onPressed: () {
              //Firestore.instance.collection('cards').document('cardNum').delete();
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
