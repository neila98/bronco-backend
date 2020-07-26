import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardList extends StatefulWidget {
  get context => clist;
  @override
  _CardListState createState() => _CardListState();

  const CardList({Key key, this.clist}) : super(key: key);
  final Card clist;
}

class _CardListState extends State<CardList> {
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
          "About Us",
          textAlign: TextAlign.center,
        ),
        backgroundColor: _appBarColor,
        centerTitle: true,
      ),
      body: Dismissible(
          key: new ObjectKey(context),
          child: Row(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('cards').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) return new Text("Loading ...");

                    {
                      return Column(
                        children: snapshot.data.documents.map((doc) {
                          return ListTile(title: Text(doc.data['cardNum']));
                        }).toList(),
                      );
                    }
                    /* else {
                  return SizedBox();
                }*/
                  })
            ],
          ),
          confirmDismiss: (DismissDirection dismissDirection) async {
            switch (dismissDirection) {
              case DismissDirection.endToStart:
              case DismissDirection.startToEnd:
                return await _showConfirmationDialog(context, 'delete') == true;
              case DismissDirection.horizontal:
              case DismissDirection.vertical:
              case DismissDirection.up:
              case DismissDirection.down:
                assert(false);

                break;
            }
            return false;
          }),
    );
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
              Firestore.instance.collection('cardNum').document('').delete();
              //Navigator.pop(context, true); // showDialog() returns true
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
