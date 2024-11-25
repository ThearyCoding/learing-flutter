import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatefulWidget {

  @override
  State<IntroPage2> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You Got a Long With Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.network("https://lottie.host/52c0dfe0-8f3f-4580-938c-f4b47cf0d7e9/vgirTYziIo.json")
          ],
        ),
      ),
    );
  }
}
