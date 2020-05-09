
import 'package:bronco2/Payment/InsertPayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flushbar/flushbar.dart';

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
class AddNewCard extends StatefulWidget {

  const AddNewCard({
    Key key,
    this.cardNum,
    this.expiryDate, 
    this.ownerName, 
    this.cvv, 
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
  }): super(key: key);

  final String cardNum;
  final String expiryDate;
  final String ownerName;
  final String cvv;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNum;
  String expiryDate;
  String ownerName;
  String cvv;
  bool isCvvFocused = false;
  Color themeColor;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextController _cardNumController = MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController = MaskedTextController(mask: '00/00');
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _cvvController = MaskedTextController(mask: '000');
  
  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange()
  {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel(){
    cardNum = widget.cardNum ?? '';
    expiryDate = widget.expiryDate ?? '';
    ownerName = widget.ownerName ?? '';
    cvv = widget.cvv ?? '';

    creditCardModel = CreditCardModel(cardNum, expiryDate, ownerName, cvv, isCvvFocused);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumController.addListener(() {
      setState(() {
        cardNum = _cardNumController.text;
        creditCardModel.cardNumber = cardNum;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _ownerNameController.addListener(() {
      setState(() {
        ownerName = _ownerNameController.text;
        creditCardModel.cardHolderName = ownerName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvController.addListener(() {
      setState(() {
        cvv = _cvvController.text;
        creditCardModel.cvvCode = cvv;
        onCreditCardModelChange(creditCardModel);
      });
    });

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
           onPressed:(){
             navigateToPayment(context);
           } 
           ),
        title: Text(
          'Add New Card',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff21254A),
      ),
     resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff21254A),
      body: Form(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor, secondColor])
          ),
          child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextFormField(
                controller: _cardNumController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Number',
                  hintText: '**** **** **** ****',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _expiryDateController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expiry Date',
                  hintText: 'MM/YY',
                ),
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _cvvController,
                //focusNode: cvvFocusNode,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                  hintText: '***',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (String text){
                  setState(() {
                    cvv = text;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _ownerNameController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Holder',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height:20.0),
            Container(
              width: 300.0,
              child: MaterialButton(
                child: Text(
                  'Save Card',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Color.fromRGBO(33, 37, 74, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)
                ),
                onPressed: ()=> showSnackBar(context)),
            ),
          ],
        ),
        ),
      ),
    );
  }
  void showSnackBar(BuildContext context){
  Flushbar(
    mainButton: FlatButton(
      onPressed: (){
        navigateToPayment(context);
      }, 
      
      child: 
      Text(
        'Proceed To Payment',
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
      title: 'Successful',
      message: 'New Card Added',
      duration: Duration(seconds: 10),

  )..show(context);
}

}
Future navigateToPayment(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => InsertPayment()));
}