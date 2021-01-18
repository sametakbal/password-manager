import 'package:flutter/material.dart';
import 'package:password_manager/util/const.dart';

class PaymentCardPage extends StatefulWidget {
  @override
  _PaymentCardPageState createState() => _PaymentCardPageState();
}

class _PaymentCardPageState extends State<PaymentCardPage> {
  double screenWidth;
  double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'New Payment Card',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
        ),
        body: paymentCardForm());
  }

  Widget paymentCardForm() {
    final titleFormField = TextFormField(
        //controller: passwordEditTextController,
        decoration: InputDecoration(
      border: outlineInputBorder,
      labelText: 'Title',
      suffixIcon: Icon(Icons.title_rounded),
    ));

    final cardHolderNameFormField = TextFormField(
        //controller: passwordEditTextController,
        decoration: InputDecoration(
      border: outlineInputBorder,
      labelText: 'Card Holder',
      suffixIcon: Icon(Icons.person),
    ));
    final cardNumberFormField = TextFormField(
        //controller: passwordEditTextController,
        decoration: InputDecoration(
      border: outlineInputBorder,
      labelText: 'Card Number',
      suffixIcon: Icon(Icons.credit_card_rounded),
    ));
    final monthYearFormField = TextFormField(
      //controller: passwordEditTextController,
      decoration: InputDecoration(
          border: outlineInputBorder,
          labelText: 'Month / Year',
          suffixIcon: Icon(Icons.calendar_today)),
    );

    final saveButton = FlatButton(
      minWidth: screenWidth / 2,
      color: primaryColor,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        'SAVE',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final cvcFormField = TextFormField(
        //controller: passwordEditTextController,
        decoration: InputDecoration(
            border: outlineInputBorder,
            labelText: 'CVC',
            suffixIcon: Icon(Icons.code_rounded)));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          titleFormField,
          SizedBox(
            height: 10,
          ),
          cardHolderNameFormField,
          SizedBox(
            height: 10,
          ),
          cardNumberFormField,
          SizedBox(
            height: 10,
          ),
          monthYearFormField,
          SizedBox(
            height: 10,
          ),
          cvcFormField,
          saveButton
        ],
      ),
    );
  }
}
