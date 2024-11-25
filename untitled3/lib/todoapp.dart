import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:untitled3/DetailApp.dart';
import 'package:untitled3/addInformation.dart';
import 'package:untitled3/post.dart';

import 'order_Cart.dart';

class DisplayProduct extends StatefulWidget {
  @override
  _DisplayProductState createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  final List<Post> _posts = [];
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptioncController = TextEditingController();
  File? _image;

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _post() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        _posts.add(Post(
          text: _postController.text,
          imagePath: _image != null ? _image!.path : null,
          price: _priceController.text,
          description: _descriptioncController.text,
          date: DateTime.now(),
        ));
        _postController.clear();
        _image = null;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.khmer24.co/23-09-05/full-size-custom-mechanical-keyboard-blue-switch--159876169391561480871828-b.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(28)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.vox-cdn.com/thumbor/D7ih_Pn7n2oSqxsmXtS5X6-ufUs=/0x0:1080x863/1400x788/filters:focal(540x432:541x433)/cdn.vox-cdn.com/uploads/chorus_asset/file/19606512/EN8QytwVAAAfPJh.jpeg"),
                      ),
                      borderRadius: BorderRadius.circular(28)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://geekculture.co/wp-content/uploads/2023/05/geek-review-msi-katana-17-20.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(28)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/81fZmxBbQgL._AC_SL1500_.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(28)),
                ),
              ],
              options: CarouselOptions(
                height: 270.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Popular"),
                    Text("See more"),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.2),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  Post post = _posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailApp(
                          post: _posts[index],
                        );
                      }));
                    },
                    child: Container(
                      width: 130,
                      height: MediaQuery.of(context).size.height / 0.2,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0)),
                                image: post.imagePath != null
                                    ? DecorationImage(
                                        image: FileImage(File(post.imagePath!)),
                                        fit: BoxFit.fitWidth,
                                      )
                                    : DecorationImage(
                                        // Placeholder or alternative content when no image is found
                                        image: NetworkImage(
                                            "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"), // Provide your placeholder image asset
                                        fit: BoxFit.fitWidth,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    child: Text(
                                      post.text,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      maxLines: 1,
                                    ),
                                  ),
                                  Text(
                                    "price(\$) ${post.price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 8),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return AddInformation();
          }));
          if (result != null && result is Post) {
            setState(() {
              _posts.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
