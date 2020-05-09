import 'package:flutter/material.dart';
import 'package:bronco2/Settings/settings.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Item {
  const Item(this.relationship);
  final String relationship;
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  String _date = "Not set";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Item selectedRelationship;
    List<Item> rel = <Item>[
      const Item('Mother'),
      const Item('Father'),
      const Item('Brother'),
      const Item('Sister'),
      const Item('Spouse'),
      const Item('Friend'),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [secondColor, firstColor]),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 350.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [secondColor, firstColor]),
                    )),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [secondColor, firstColor]),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 100.0,
                  left: 15.0,
                  right: 15.0,
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          gradient: LinearGradient(
                              colors: [firstColor, secondColor])),
                    ),
                  ),
                ),
                Positioned(
                  top: 60.0,
                  left: (MediaQuery.of(context).size.width / 2 - 50.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 170.0,
                  left: (MediaQuery.of(context).size.width / 2) - 105.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Amelia Rose',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        'W E L C O M E',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            color: Color.fromRGBO(33, 37, 74, 1),
                            onPressed: () {},
                            child: Text(
                              'Member ID',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            color: Color.fromRGBO(33, 37, 74, 1),
                            onPressed: () {},
                            child: Text(
                              'Points',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  new Column(
                    //delete
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _status ? _getEditIcon() : new Container(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            buildEmail(),

            SizedBox(height: 12.0),
            buildContactNumber(),

            SizedBox(height: 12.0),
            buildPassword(),
            !_status ? _getActionButtons() : new Container(),

            //break

            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _status ? _getEditIcon() : new Container(),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.0),
            buildName(),

            SizedBox(height: 12.0),
            buildDOB(context),
            !_status ? _getActionButtons() : new Container(),

            SizedBox(height: 80.0),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Family and Friends',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  new Column(
                    //delete
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _status ? _getEditIcon() : new Container(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
            InkWell(
              onLongPress: () {
                return setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(7.0),
                  elevation: 4.0,
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildRelationship(selectedRelationship, rel),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            !_status ? _getActionButtons() : new Container(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Padding buildDOB(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          elevation: 4.0,
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  new Text(
                    'Date of Birth',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6.0),
                  buildDatePicker(context),
                ],
              ),
            ),
          ),
        ));
  }

  Padding buildName() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          elevation: 4.0,
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  new Text(
                    'Full Name',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  new Flexible(
                    child: new TextField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your Full Name",
                      ),
                      enabled: !_status,
                      autofocus: !_status,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding buildPassword() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          elevation: 4.0,
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  new Text(
                    'Change Password',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  new Flexible(
                    child: new TextField(
                      decoration: const InputDecoration(
                        hintText: "Enter New Password",
                      ),
                      enabled: !_status,
                      autofocus: !_status,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding buildContactNumber() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          elevation: 4.0,
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  new Text(
                    'Contact Number',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  new Flexible(
                    child: new TextField(
                      decoration: const InputDecoration(
                        hintText: "+601X-XXXXXX",
                      ),
                      enabled: !_status,
                      autofocus: !_status,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding buildEmail() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          elevation: 4.0,
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  new Text(
                    'Email',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  new Flexible(
                    child: new TextField(
                      decoration: const InputDecoration(
                        hintText: "example@gmail.com",
                      ),
                      enabled: !_status,
                      autofocus: !_status,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  List<Widget> buildRelationship(Item selectedRelationship, List<Item> rel) {
    return <Widget>[
      SizedBox(height: 15.0),
      new Text(
        'Name',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 4.0),
      new Flexible(
        child: new TextField(
          decoration: const InputDecoration(
            hintText: "Enter Name",
          ),
          enabled: !_status,
          autofocus: !_status,
        ),
      ),
      SizedBox(height: 20.0),
      new Text(
        'Relationship',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 4.0),
      new Flexible(
        child: new DropdownButton<Item>(
            hint: Text('Select Relationship'),
            value: selectedRelationship,
            onChanged: (Item Value) {
              setState(() {
                selectedRelationship = Value;
              });
            },
            items: rel.map((Item r) {
              return DropdownMenuItem<Item>(
                  child: Row(
                children: <Widget>[
                  Text(
                    r.relationship,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ));
            }).toList()),
      ),
      SizedBox(height: 10.0),
    ];
  }

  RaisedButton buildDatePicker(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.pink[100],
      elevation: 4.0,
      onPressed: () {
        DatePicker.showDatePicker(context,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            minTime: DateTime(1900, 1, 1),
            maxTime: DateTime(2020, 01, 01), onConfirm: (date) {
          print('confirm $date');
          _date = '${date.day} - ${date.month} - ${date.year}';
          setState(() {});
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 18.0,
                        color: Colors.black,
                      ),
                      Text(
                        " $_date",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "  Change",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: 16.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

Future navigateToSettings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
}
