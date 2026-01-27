import 'package:flutter/material.dart';

class Authtextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController contoller;
  const Authtextfield({
    super.key,
    required this.hinttext,
    required this.contoller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contoller,
      decoration: InputDecoration(hintText: hinttext),
    );
  }
}
