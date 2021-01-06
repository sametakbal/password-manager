import 'package:flutter/material.dart';
import 'package:password_manager/models/card.dart';
import 'package:password_manager/services/card_service.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final _cardTextColor = Color(0xff1856e3);
  double screenWidth;
  double screenHeight;
  // final _selectedCardTextColor = Color(0xffffff);
  var cardList = List<PaymentCard>();

  @override
  void initState() {
    cardList = CardService.getPaymentCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      getCardContainerRow(),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'All',
              style: TextStyle(
                  fontSize: 16.0,
                  color: _cardTextColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Recent',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Favorites',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      getPaymentCardList(),
    ]);
  }

  Widget getPaymentCardList() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(screenHeight / 152),
              child: Card(
                elevation: 0.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: ListTile(
                  isThreeLine: true,
                  leading: Image.asset(
                    cardList[index].imgUrl,
                    width: screenHeight / 15,
                  ),
                  title: Text(
                    cardList[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    cardList[index].cardNumber,
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.star_border_rounded,
                    color: _cardTextColor,
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getCardContainerRow() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            getCard(Icons.lock_outline, 'Password'),
            getCard(Icons.credit_card, 'Cards'),
            getCard(Icons.map_outlined, 'Addresses'),
          ],
        ),
      ),
    );
  }

  Widget getCard(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0.5,
      child: Container(
        height: screenHeight / 3.8,
        width: screenWidth / 2.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: screenHeight / 19,
              color: Color(0xff1856e3),
            ),
            SizedBox(
              height: screenHeight / 50,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _cardTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
