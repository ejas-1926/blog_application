import 'package:blog_application/features/auth/presentation/widgets/authtextfield.dart';
import 'package:blog_application/features/auth/presentation/widgets/submitbutton.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Ins", style: TextStyle(fontSize: 50)),
            Form(
              child: Column(
                children: [
                  Authtextfield(hinttext: "Name"),
                  SizedBox(height: 10),
                  Authtextfield(hinttext: "password"),
                  SizedBox(height: 10),
                  Submitbutton(buttontext: "Sign Up", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
