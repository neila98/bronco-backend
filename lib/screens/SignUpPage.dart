import 'package:bronco2/HomePage/HomePage.dart';
import 'package:bronco2/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameInputController =
      TextEditingController();
  final TextEditingController lastNameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController pwdInputController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  bool _success;
  String _userEmail;

  @override
  initState() {
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff21254A),
      body: ListView(
        children: <Widget>[
          Container(
              height: 200,
              child: Stack(children: <Widget>[
                Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/2.gif"),
                )))),
              ])),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "BRONCO AIRLINES\n         SIGN UP",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _signupFormKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: firstNameInputController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "First Name",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: lastNameInputController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last Name",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: pwdInputController,
                              obscureText: true,
                              validator: pwdValidator,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Create Password",
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                    color: Color.fromRGBO(33, 37, 74, 1),
                    onPressed: () async {
                      //navigateToHomePage(context);
                      if (_signupFormKey.currentState.validate()) {
                        // setState(() {
                        //   _register();
                        // });
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new LoginPage();
                        // }));
                        _firebaseAuth
                            .createUserWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((currentUser) => Firestore.instance
                                        .collection("users")
                                        .document(currentUser.uid)
                                        .setData({
                                      "uid": currentUser.uid,
                                      "fname": firstNameInputController.text,
                                      "surname": lastNameInputController.text,
                                      "email": emailInputController.text,
                                      "password": pwdInputController.text,
                                    }).then((result) => {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()),
                                                  (_) => false),
                                              firstNameInputController.clear(),
                                              lastNameInputController.clear(),
                                              emailInputController.clear(),
                                              pwdInputController.clear(),
                                            })
                                //     .catchError((err) => print(err)))
                                // .catchError((err) => print(err)
                                );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("Try Again"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.pink[200],
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0),
                        ],
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailInputController.dispose();
    pwdInputController.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: emailInputController.text,
      password: pwdInputController.text,
    ));
    if (user != null) {
      setState(() async {
        _success = true;
        _userEmail = user.email;
        final currentuid = await getCurrentUID();
        _firestore.collection('users').document(currentuid).setData({
          // 'contactno': _contactController.text.toString(),
          // 'dob': _ageController.text.toString(),
          'email': emailInputController.text.toString(),
          'fname': firstNameInputController.text.toString(),
          'surname': lastNameInputController.text.toString(),
          // 'fullname': _schoolController.text.toString(),
          'password': pwdInputController.text.toString(),
        });
      });
    } else {
      _success = false;
    }
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}
