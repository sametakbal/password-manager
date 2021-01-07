class PaymentCard {
  int id;
  String title;
  String cardNumber;
  String cardHolderName;
  int cvc;
  int month;
  int year;
  bool isFavorite;
  PaymentCard({
    this.id,
    this.title,
    this.cardNumber,
    this.cardHolderName,
    this.cvc,
    this.month,
    this.year,
    this.isFavorite,
  });
}
