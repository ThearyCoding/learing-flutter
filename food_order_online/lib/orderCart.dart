import 'package:flutter/material.dart';
import 'package:food_order_online/modelclass.dart';
import 'package:food_order_online/product.dart';
import 'package:provider/provider.dart';
class OrderCart extends ChangeNotifier {
  final List<Product> _order = [];

  List<Product> get order => _order;

  void addProduct(Product product){
    if(_order.contains(product)){
      _order.remove(product);
    }else{
      _order.add(product);
    }
    notifyListeners();
  }

  bool isExist (Product product){
    final Isexist = _order.contains(product);
    return Isexist;
  }

  static OrderCart of(
    BuildContext context,{
      bool listen = true,
    }
  ){
    return Provider.of(context,
    listen: listen,
    );
  }
}