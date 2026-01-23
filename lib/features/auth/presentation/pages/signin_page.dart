import 'package:blog_application/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/widgets/authtextfield.dart';
import 'package:blog_application/features/auth/presentation/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController paswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    paswordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Ins", style: TextStyle(fontSize: 50)),
              Form(
                child: Column(
                  children: [
                    Authtextfield(
                      hinttext: "Email",
                      contoller: emailcontroller,
                    ),
                    SizedBox(height: 10),
                    Authtextfield(
                      hinttext: "password",
                      contoller: paswordcontroller,
                    ),
                    SizedBox(height: 10),
                    Submitbutton(
                      buttontext: "Sign Up",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthSignUpEvent(
                            name: emailcontroller.text,
                            email: emailcontroller.text,
                            password: paswordcontroller.text,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
