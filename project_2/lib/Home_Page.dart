import 'package:flutter/material.dart';
import 'package:project_2/component/My_Button_nav_bar.dart';
import 'package:project_2/page/cart_page.dart';
import 'package:project_2/page/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateButtonBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyButtonNavBar(
        onTabChange: (index) => navigateButtonBar(index),
      ),
      body: _page[_selectedIndex],
    );
  }
}