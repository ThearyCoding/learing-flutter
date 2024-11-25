import 'package:flutter/material.dart';
import 'package:project_2/Home_Page.dart';
import 'package:project_2/moduls/coffe_shop.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}