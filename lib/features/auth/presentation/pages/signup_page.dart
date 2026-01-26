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
  TextEditingController namecontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: TextStyle(fontSize: 50)),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  shownotifier(context, state.message.toString());
                } else if (state is AuthSuccess) {
                  shownotifier(context, state.userid.name);
                }
              },

              //in dart we can check whether the variable is of a purticular type
              //using the is keyword
              builder: (context, state) {
                if (state is AuthLoading) {
                  //you can wrap any widget in a class
                  //of stateless widget and call
                  //that class automatically
                  //the builder method will get called

                  return Loader();
                }

                return Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Authtextfield(
                        hinttext: "Name",
                        contoller: namecontroller,
                      ),
                      SizedBox(height: 10),
                      Authtextfield(
                        hinttext: "email",
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
                              name: namecontroller.text,
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
    );
  }
}
