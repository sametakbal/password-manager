class PaymentCard {
  int id;
  String title;
  String cardNumber;
  String cardHolderName;
  int cvc;
  String monthYear;
  bool isFavorite;
  PaymentCard({
    this.id,
    this.title,
    this.cardNumber,
    this.cardHolderName,
    this.cvc,
    this.monthYear,
    this.isFavorite,
  });
}
