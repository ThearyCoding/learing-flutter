import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatefulWidget {

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's Find Something",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25,),
            Lottie.network("https://lottie.host/2304a960-4b11-43f6-9ff9-9d2045f7dc79/qIahikqhZo.json")
          ],
        ),
      ),
    );
  }
}
