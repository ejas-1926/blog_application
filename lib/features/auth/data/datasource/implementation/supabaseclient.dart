import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/data/models/userdbmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource implements IAuthDataSource {
  final SupabaseClient _supabaseClient;

  SupabaseDataSource(SupabaseClient sb) : _supabaseClient = sb;

  @override
  Future<Userdbmodel> signin(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw Exception();
      }

      Map<String, dynamic> mappings = response.user!.toJson();

      return Userdbmodel.fromjson(mappings);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Userdbmodel> signup(String name, String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {"name": name},
      );
      if (response.user == null) {
        throw Exception();
      }

      Map<String, dynamic> mappings = response.user!.toJson();

      return Userdbmodel.fromjson(mappings);
    } catch (e) {
      throw Exception();
    }
  }
}

//we are throwing the exception twice ie in the catch block as well
//so that this value will be thrown again at the higher level above this
