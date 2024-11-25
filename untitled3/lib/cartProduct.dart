import 'package:flutter/material.dart';
import 'dart:io';
import 'order_Cart.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    final provider = OrderCart.of(context);
    final finalList = provider.order;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      finalList[index].text,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(finalList[index].price.toString()),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: finalList[index].imagePath != null
                          ? FileImage(File(finalList[index].imagePath!))
                          : null, // Set to null if imagePath is null
                      backgroundColor: Colors.red.shade100,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        finalList.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
