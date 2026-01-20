import 'package:flutter/material.dart';
import 'package:stkui/models/payment_provider.dart';
import 'package:stkui/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:stkui/services/payment_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<PaymentService>(create: (_) => PaymentService(),),
          ChangeNotifierProvider(
              create: (context) => PaymentProvider(
                context.read<PaymentService>()
              )
          )
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
