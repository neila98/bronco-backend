import 'package:bronco2/HomePage/HomePage.dart';
import 'package:bronco2/screens/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController pwdInputController = TextEditingController();
  //bool _success;
  //String _userEmail;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getUid() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  Future<String> signInWithEmailAndPassword(
      String emailInputController, String pwdInputController) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: emailInputController, password: pwdInputController))
        // .user
        .uid;
  }

  final firestore = Firestore.instance;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "BRONCO AIRLINES \nWelcomes you back",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                  ),
                  child: Form(
                    key: _formKey,
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
                            controller: emailInputController,
                            validator: emailValidator,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email Address",
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
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.pink[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                    color: Color.fromRGBO(33, 37, 74, 1),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // _signin();
                        String uid = await signInWithEmailAndPassword(
                            emailInputController.text, pwdInputController.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new HomePage();
                        }));
                        print("Signed In with ID $uid");
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "Email or password entered is incorrect. Try again."),
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
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                new InkWell(
                  onTap: () {
                    navigateToSignUpPage(context);
                  },
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.pink[200],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // void _signin() async {
  //   final FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
  //     email: emailInputController.text,
  //     password: pwdInputController.text,
  //   ));
  //   if (user != null) {
  //     setState(() async {
  //       _success = true;
  //       _userEmail = user.email;
  //       final currentUseruid = await getUid();
  //       firestore.collection("users").document(currentUseruid).get().then(
  //           (DocumentSnapshot result) =>
  //               Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                 return new HomePage();
  //               })));
  //       // .catchError((err) => print(err))
  //       // .catchError((err) => print(err));
  //     });
  //   } else {
  //     _success = false;
  //   }
  // }
}

Future navigateToHomePage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}

Future navigateToSignUpPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUpPage()));
}

showDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    child: AlertDialog(
      backgroundColor: Color.fromRGBO(49, 39, 79, 1),
      title: Text('Login Successful',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
      content: Text('Welcome to Bronco Airlines!',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
      actions: <Widget>[
        Center(
          child: InkWell(
            onTap: () {
              navigateToHomePage(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.pink[200],
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0),
                ],
                color: Color.fromRGBO(49, 39, 79, 1),
              ),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
