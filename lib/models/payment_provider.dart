import 'package:flutter/material.dart';
import 'package:stkui/enums/payment_status.dart';
import 'package:stkui/services/payment_service.dart';

class PaymentProvider extends ChangeNotifier{

  PaymentService _service;
  PaymentProvider(this._service);

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
    try{
      await _service.sendStkPush(phone, amount);
      _status = PaymentStatus.success;
    } catch(e){
      _errorMessage = e.toString();
      _status = PaymentStatus.failure;
    }

    notifyListeners();
  }
  void reset() {
    _status = PaymentStatus.idle;
    _errorMessage = null;
    notifyListeners();
  }
}