import 'package:blog_application/core/constants/dbconstants.dart';
import 'package:blog_application/core/themes/app_theme.dart';
import 'package:blog_application/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void  main() async
{
  WidgetsFlutterBinding.ensureInitialized();
await Supabase.initialize(url: Dbconstants.url ,anonKey: Dbconstants.anonKey);
runApp(Blogapplication());
}

class Blogapplication extends StatelessWidget {
  const Blogapplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:AppTheme.darkThemeMode,home: SignupPage(),);
  }
}