import 'package:flutter/material.dart';

class Submitbutton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressed;
  const Submitbutton({
    super.key,
    required this.buttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttontext));
  }
}
