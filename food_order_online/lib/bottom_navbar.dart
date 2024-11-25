import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class bottomNavigationBar extends StatefulWidget {
  int currentState = 0;
  bottomNavigationBar({required this.currentState,});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      animationCurve: Curves.linear,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.red,
      index: widget.currentState,
      color: Colors.black12,
      items: const [
      Icon(Icons.home),
      Icon(Icons.favorite),
      Icon(Icons.settings),
      
    ]);
  }
}