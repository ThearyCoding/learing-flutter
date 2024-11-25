
import 'package:flutter/material.dart';
import 'package:food_order_online/modelclass.dart';
import 'package:food_order_online/product.dart';

class DetailScreen extends StatelessWidget {
  Product product;
  DetailScreen({super.key, 
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // Use the received data to build your detail screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(product.image),
            Text('Names: ${product.name}'),
            Text('Prices: ${product.price}'),
            Text('catagory: ${product.catagory}'),
          ],
        ),
      ),
    );
  }
}
