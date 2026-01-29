import 'package:blog_application/core/themes/app_theme.dart';
import 'package:blog_application/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:blog_application/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_application/initdependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initdependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
      ],
      child: Blogapplication(),
    ),
  );
}

class Blogapplication extends StatefulWidget {
  const Blogapplication({super.key});

  @override
  State<Blogapplication> createState() => _BlogapplicationState();
}

class _BlogapplicationState extends State<Blogapplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkThemeMode, home: SignupPage());
  }
}
