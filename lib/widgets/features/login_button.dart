import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class loginButton extends StatelessWidget {
  String text;
  final Color color;

  loginButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
