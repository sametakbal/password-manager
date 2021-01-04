import 'package:flutter/material.dart';
import 'package:password_manager/models/card.dart';
import 'package:password_manager/services/card_service.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final _cardTextColor = Color(0xff1856e3);
  // final _selectedCardTextColor = Color(0xffffff);
  var cardList = List<PaymentCard>();

  @override
  void initState() {
    cardList = CardService.getPaymentCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: ListTile(
                  isThreeLine: true,
                  leading: Image.asset(
                    cardList[index].imgUrl,
                    width: 50,
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
      elevation: 0.0,
      child: Container(
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Color(0xff1856e3),
            ),
            SizedBox(
              height: 15,
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
