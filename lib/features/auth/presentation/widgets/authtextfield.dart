import 'package:flutter/material.dart';

class Authtextfield extends StatelessWidget {
  final String hinttext;

  const Authtextfield({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: hinttext));
  }
}
