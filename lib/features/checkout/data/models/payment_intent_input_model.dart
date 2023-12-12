class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  Map<String, dynamic> toJson() {
    return {
      // "amount": "${(double.parse(amount) * 100).toStringAsFixed(0)}",
      "amount": (double.parse(amount) * 100).toStringAsFixed(0),
      "currency": currency,
      "customer": customerId
    };
  }
}
