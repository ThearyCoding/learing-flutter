import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Homepage.dart';
import 'package:untitled3/order_Cart.dart';
import 'package:untitled3/todoapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => OrderCart())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: HomePage(),
        ),
      );
}
