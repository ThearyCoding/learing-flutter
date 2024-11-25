import 'package:flutter/material.dart';
import 'package:project_2/component/coffee_tile.dart';
import 'package:project_2/moduls/coffe_shop.dart';
import 'package:project_2/moduls/coffee.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void RemoveFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Your Cart",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.usercart.length,
                            itemBuilder: (context, index) {
                              Coffee earchCoffee = value.usercart[index];

                              return CoffeeTile(
                                  coffee: earchCoffee,
                                  onPressed: () => RemoveFromCart(earchCoffee),
                                  icon: Icon(Icons.delete));
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Total: ${value.totalCarPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Payment Details"),
                            content: Container(
                              width: 100,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (Coffee coffee in value.usercart)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Coffee: ${coffee.name}"),
                                        Text(
                                            "Price: ${coffee.price}"),
                                        Divider(),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); 
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      ),
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
