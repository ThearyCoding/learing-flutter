import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  String path;
  ButtonLogin({super.key,required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        path,
        height: 63,
      ),
    );
  }
}