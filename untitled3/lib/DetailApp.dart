import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/post.dart';
import 'package:intl/intl.dart';

import 'order_Cart.dart';
class DetailApp extends StatefulWidget {
  final Post post;

  DetailApp({Key? key, required this.post}) : super(key: key);

  @override
  State<DetailApp> createState() => _DetailAppState();
}

class _DetailAppState extends State<DetailApp> {

  @override
  Widget build(BuildContext context) {
    final provider = OrderCart.of(context);
    return Scaffold(
      body: CustomScrollView(
        anchor: 0,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.8,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: widget.post.imagePath != null
                  ? Image.file(
                File(widget.post.imagePath!),
                fit: BoxFit.cover,
              )
                  : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"), // Provide your placeholder image asset
                      fit: BoxFit.fitWidth,
                    ),
                  ),
              ),
            ),
            leading: Container(
              margin: EdgeInsets.only(left: 12.0,bottom: 10),
              height: 40.0,  // Adjusted height
              width: 40.0,   // Adjusted width
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            leadingWidth: 80.0,
            bottom: PreferredSize(
              child: Container(
                alignment: Alignment.center,
                height: 32.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    topLeft: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 40.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              preferredSize: const Size.fromHeight(0.0),  // Adjusted height
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.post.text}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '\$${widget.post.price}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                  child: Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  height: 193.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.post.description ?? 'No description available',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,top: 5),
                  child: Text(
                    "Size",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,top: 6,right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                        color: Colors.brown.shade800,
                        ),
                        width: 100.0,
                        height: 30.0,
                        child: Text(
                          "S: 34-36",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade800,
                        ),
                        width: 100.0,
                        height: 30.0,
                        child: Text(
                          "M: 38-40",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade800,
                        ),
                        width: 100.0,
                        height: 30.0,
                        child: Text(
                          "L: 42-44",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
                  decoration: BoxDecoration(

                  ),
                  child: Text(
                    "Post Date : ${DateFormat('h:mm a - MMM/d/yyyy').format(widget.post.date)}"
                  ),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    // Use Provider to access the OrderCart and add the item
                    Provider.of<OrderCart>(context, listen: false).addPost(widget.post);

                    // Show a snackbar or any other UI feedback if needed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item added to cart'),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    height: 40.0,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.brown.shade800
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
