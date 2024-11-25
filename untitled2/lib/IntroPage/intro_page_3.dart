import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatefulWidget {

  @override
  State<IntroPage3> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Now Let's Get to Work!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.network("https://lottie.host/c6bfd4cf-5ef2-444d-b889-443138031b40/fz8qmS66Mk.json")
          ],
        ),
      ),
    );
  }
}
