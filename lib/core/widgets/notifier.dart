import 'package:flutter/material.dart';

void shownotifier(BuildContext context, String message) {
  // ScaffoldMessenger.of(context).hideCurrentSnackBar();
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  //the cascade expression is shown below
  //this is helpful as there is no need of writing the full code
  //write the common code and where ever calling seperate, use the cascading operator

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message), duration: Duration(milliseconds: 1000)),
    );
}
