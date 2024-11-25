import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class MyButtonNavBar extends StatelessWidget {
  const MyButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(tabs: [
      GButton(
        icon: Icons.home,
        text: 'Home',
      ),
      GButton(
        icon: Icons.shop,
        text: 'Shop',
      )
    ],);
  }
}