import 'package:flutter/material.dart';
import 'package:project_2/moduls/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(name: 'Latte', price: "1.98", imagePath: 'assets/coffee_latte.png'),
    Coffee(name: 'Expresso', price: "0.99", imagePath: 'assets/coffee_expresso.png'),
    Coffee(name: 'Cappuccino', price: "2.99", imagePath: 'assets/coffee-cappuccino.png'),
    // Coffee(name: 'Mocha', price: '3.32', imagePath: 'assts/coffee-mocha.png'),
    Coffee(name: 'Americano', price: '3.50', imagePath: 'assets/americano.png'),
  ];
  
  // user coffee
  List<Coffee> _userCarts = [];

  // get coffee list

  List<Coffee> get shop{
    return _shop;
  }

  // get user cart

  List<Coffee> get usercart => _userCarts;


  // add item to cart list

  void addToCart(Coffee coffee){
    _userCarts.add(coffee);
    notifyListeners();
  }

  // remove item from cart list

  void removeFromCart(Coffee coffee){
    _userCarts.remove(coffee);
    notifyListeners();
  }


  // calculate total price of items in the cart lsit


  double get totalCarPrice {
    double totalPrice = 0.0;

    for(Coffee coffee in _userCarts){
      totalPrice += double.parse(coffee.price);
    }

    return totalPrice;
  }

}