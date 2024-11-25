import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'Home_Page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Intro(),
    );
  }
}
class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            // Image.network("https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png"),
            Lottie.network("https://lottie.host/fe231f63-6705-4514-91f2-f792e12ebcd2/VQP6xzG540.json"),
            // Container(
            //
            //   child: CachedNetworkImage(
            //         imageUrl: "https://cdn.freebiesupply.com/logos/large/2x/nike-4-logo-png-transparent.png",
            //         placeholder: (context,url)=> SizedBox(
            //           width: 50.0,
            //           height: 50.0,
            //           child: Center(
            //             child: CircularProgressIndicator(
            //               strokeWidth: 3.0,
            //               backgroundColor: Colors.black,
            //               color: Colors.orange,
            //             ),
            //           ),
            //         ),
            //         errorWidget: (context,url,error) => Icon(Icons.error),
            //   )
            // ),
            Text("Just Do it",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Brand new sneaker and custom kicks made with premium quality",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,

              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24,),
            SizedBox(
              height: 60,
              width: double.infinity,

              child: ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text("Shop Now",style: TextStyle(color: Colors.white),),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}



