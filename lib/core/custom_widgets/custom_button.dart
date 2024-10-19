import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = '',
    this.color = Colors.blue,
  });

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        color: color,
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
      ),
    );
  }
}