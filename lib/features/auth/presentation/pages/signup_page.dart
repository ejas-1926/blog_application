import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,children:[Text("Sign Up",style: TextStyle(fontSize: 50)),Form(child: Column(children:[TextField()]))])),);
  }
}