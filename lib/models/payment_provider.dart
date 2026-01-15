import 'package:flutter/material.dart';
import 'package:stkui/enums/payment_status.dart';

class PaymentProvider extends ChangeNotifier{

  PaymentStatus _status = PaymentStatus.idle;
  String? _errorMessage;

  PaymentStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> initiatePayment({
    required String phone,
    required double amount,
  }) async {
    _status = PaymentStatus.loading;
    notifyListeners();


  }

}