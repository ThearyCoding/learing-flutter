import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'teamclass.dart'; // Assuming you have the Product class in 'teamclass.dart'

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [];
  List<Product> filteredProducts = [];

  Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.https('fakestoreapi.com', 'products'));
    var jsonData = jsonDecode(response.body);
    for (var eachProduct in jsonData) {
      var product = Product(
        title: eachProduct['title'],
        price: eachProduct['price'],
        image: eachProduct['image'],
      );
      products.add(product);
    }
    return products;
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => filterProducts(query),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: filteredProducts.isNotEmpty
                          ? filteredProducts.length
                          : products.length,
                      itemBuilder: (context, index) {
                        final currentProduct = filteredProducts.isNotEmpty
                            ? filteredProducts[index]
                            : products[index];
                    
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                          ),
                          width: 90,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(currentProduct.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${currentProduct.title}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Price : ${currentProduct.price.toString()}',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Text('Error loading data'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
