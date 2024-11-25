import 'package:flutter/material.dart';
import 'package:project_2/component/coffee_tile.dart';
import 'package:project_2/moduls/coffe_shop.dart';
import 'package:project_2/moduls/coffee.dart';
import 'package:provider/provider.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add coffee to cart

  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).addToCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value,child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          Text("How Would you like your coffee?",
          style: TextStyle(
            fontSize: 20,
          ),
          ),

          const SizedBox(height: 25,),


          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                Coffee earchCoffee = value.shop[index];

                return CoffeeTile(coffee: earchCoffee,
                onPressed: () => addToCart(earchCoffee),
                icon: Icon(Icons.add),
                );
              },
              itemCount: value.shop.length,
            ),
          )
        ],),
      ),
    )
    );
  }
}