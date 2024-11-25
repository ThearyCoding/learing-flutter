import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class MyButtonNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyButtonNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 20,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.shop,
          text: 'Shop',
        )
      ],),
    );
  }
}