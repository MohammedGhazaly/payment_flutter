import 'package:equatable/equatable.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';

class Payment extends Equatable {
  final String imagePath;

  Payment({required this.imagePath});
  static List<Payment> getPaymentsList() {
    return [
      Payment(imagePath: AppAssets.masterCard),
      Payment(imagePath: AppAssets.paybal),
      Payment(imagePath: AppAssets.applePay),
    ];
  }

  @override
  List<Object?> get props => [imagePath];
}
