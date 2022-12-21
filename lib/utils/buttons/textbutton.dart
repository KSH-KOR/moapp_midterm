import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }
}