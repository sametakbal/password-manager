import 'package:flutter/material.dart';
import 'package:password_manager/pages/app_page.dart';
import 'package:password_manager/pages/payment_card_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AppPage(),
        '/paymentCard':(context)=>PaymentCardPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Comfortaa'),
    );
  }
}
