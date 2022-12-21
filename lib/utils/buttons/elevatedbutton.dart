import 'package:flutter/material.dart';
import 'package:midterm/theme/appcolors.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonBackgroundColor = AppColors.buttonBackgroundColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color buttonBackgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: buttonBackgroundColor, ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}