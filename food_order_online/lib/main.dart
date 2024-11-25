import 'package:flutter/material.dart';
import 'package:food_order_online/orderCart.dart';
import 'package:food_order_online/pages/Home_scrren.dart';
import 'package:food_order_online/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OrderCart()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: HomeScrren(),
    ),
  );

}