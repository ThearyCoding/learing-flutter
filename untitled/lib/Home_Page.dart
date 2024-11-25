import 'package:flutter/material.dart';
import 'package:untitled/components/bottom_nav.dart';
import 'package:untitled/main.dart';

import 'components/cart_page.dart';
import 'components/shop_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedindex = index;
    });
  }
  final List<Widget> _page = [shopPage(), CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 270,
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.network(
                    "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png",
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,bottom: 25),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Intro())),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


      appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: MyBottomNar(
          onTabChange: (index)=> navigateBottomBar(index),

        ),
      body: _page[_selectedindex],
    );
  }
}
