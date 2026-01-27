import 'package:blog_application/core/widgets/loader.dart';
import 'package:blog_application/core/widgets/notifier.dart';
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
              BlocConsumer(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    shownotifier(context, state.message);
                  } else if (state is AuthSuccess) {
                    shownotifier(context, "${state.userid.name} logged in");
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    Loader();
                  }
                  return Form(
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
                              AuthSigninEvent(
                                email: emailcontroller.text,
                                password: paswordcontroller.text,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
