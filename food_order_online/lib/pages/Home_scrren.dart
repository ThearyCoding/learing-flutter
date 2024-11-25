import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_order_online/bottom_navbar.dart';
import 'package:food_order_online/pages/favorite_screen.dart';
import 'package:food_order_online/pages/home_page.dart';
import 'package:food_order_online/pages/myCard.dart';
import 'package:food_order_online/pages/profile_sereen.dart';

class HomeScrren extends StatefulWidget {
  const HomeScrren({super.key});

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List screen = [
    MyHomePage(),
    const FavoriteCart(),
    const ProfileScreen(),
  ];
  int currentState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset("assets/menu_ecommerce.png"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyCard();
                }));
              },
              icon: const Icon(
                Icons.shopping_cart_sharp,
                color: Colors.black,
              )),
        ],
      ),
      drawer: Drawer(
        // Drawer contents go here
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: screen[currentState],
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          animationCurve: Curves.linear,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.red,
          index: currentState,
          color: Colors.black12,
          onTap: (value) {
            setState(() {
              currentState = value;
            });
          },
          items: const [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.settings),
          ]),
    );
  }
}
