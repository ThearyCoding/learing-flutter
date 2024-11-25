import 'package:flutter/material.dart';
import 'package:food_order_online/orderCart.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    final provider = OrderCart.of(context);
    final finalList = provider.order;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: [
              
                Text("Order Details",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      finalList[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      
                    ),
                    subtitle: Text(
                      finalList[index].price.toString(),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(finalList[index].image),
                      backgroundColor: Colors.red.shade100,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Colors.red,
                      ),
                      onPressed: (){
                        finalList.removeAt(index);
                        setState(() {
                          
                        });
                      },
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