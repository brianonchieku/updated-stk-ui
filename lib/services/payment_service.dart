import 'package:dio/dio.dart';

class PaymentService{

  final Dio _dio = Dio();

  Future<void>sendStkPush(String phone, double amount) async{
    await _dio.post(
      'https://9a5b87047261.ngrok-free.app/stk-push',
      data: {
        'phone': phone,
        'amount': amount
      }
    );

  }
}