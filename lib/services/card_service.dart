import 'package:password_manager/models/card.dart';

class CardService {
  static CardService intance = CardService();
  static List<PaymentCard> list = [];
  static List<PaymentCard> getPaymentCards() {
    if (list.isEmpty) {
      list.add(PaymentCard(
          id: 1,
          title: "Work",
          cardNumber: "5358 **** **** 4020",
          imgUrl: "images/visa.png",
          isFavourite: false));
      list.add(PaymentCard(
          id: 1,
          title: "Patrick",
          cardNumber: "5358 **** **** 4020",
          imgUrl: "images/mastercard.png",
          isFavourite: false));
      list.add(PaymentCard(
          id: 1,
          title: "Wife",
          cardNumber: "5358 **** **** 4020",
          imgUrl: "images/visa.png",
          isFavourite: false));
    }
    return list;
  }
}
