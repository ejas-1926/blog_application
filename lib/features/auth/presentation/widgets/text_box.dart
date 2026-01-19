import 'package:flutter/material.dart';



class AuthTextBox extends StatelessWidget {

String text;

   
   AuthTextBox({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: text),);
  }
}



//this text form field provides validation 
//input decoration 