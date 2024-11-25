import 'package:flutter/material.dart';
import 'package:food_order_online/bottom_navbar.dart';
import 'package:food_order_online/modelclass.dart';
import 'package:food_order_online/orderCart.dart';
import 'package:food_order_online/pages/detail_Product.dart';
import 'package:food_order_online/pages/myCard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<String> _list_images = [
    "assets/burger_king.png",
    "assets/su_shi.png",
    "assets/pizza.png",
    "assets/ice_cream.png",
    "assets/cake.png",
  ];
  final List<String> _list_nameProducts = [
    "Burgers",
    "Su Shi",
    "Pizza",
    "Icr Cream",
    "Cake"
  ];
  final List<String> _list_Price = [
    "\$2.43", // Burgers
    "\$5.99", // Su Shi
    "\$8.50", // Pizza
    "\$4.25", // Ice Cream
    "\$12.75", // Cake
  ];
  final List<String> _list_Ratings = [
    "4.5", // Burgers rating out of 5
    "3.8", // Su Shi rating out of 5
    "4.2", // Pizza rating out of 5
    "4.0", // Ice Cream rating out of 5
    "4.7", // Cake rating out of 5
  ];

  @override
  Widget build(BuildContext context) {
    final provider = OrderCart.of(context);
    return Scaffold(
      body: ListView(
        children: [
          //catagory foods
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Catagory Foods",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [
                        Colors.pink.shade300.withOpacity(0.2),
                        Colors.white38,
                      ],
                    ),
                  ),
                  height: 120,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index >= 0 && index < _list_images.length) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    _list_images[index],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${_list_nameProducts[index]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }
                      return null;
                    },
                    itemCount: _list_images.length,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Foods",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: MyProduct.allProducts.length,
              itemBuilder: (context, index) {
                final allProduct = MyProduct.allProducts[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(product: allProduct);
                    }));
                  },
                  child: Container(
                    height: 250,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              allProduct.image,
                              width: 100,
                              height: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 4),
                                  child: Text(
                                    "${allProduct.name}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "\$${allProduct.price}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 2),
                              child: Row(
                                children: [
                                  Text(
                                    "${allProduct.quantity.toString()} : ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 18,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              provider.addProduct(allProduct);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Added to Cart"),
                                    content: Text(
                                        "${allProduct.name} has been added to your cart."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
