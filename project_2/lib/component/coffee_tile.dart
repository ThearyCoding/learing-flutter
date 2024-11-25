import 'package:flutter/material.dart';
import 'package:project_2/moduls/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;
  CoffeeTile({super.key, required this.coffee, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}