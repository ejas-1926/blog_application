import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/data/models/userdbmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource implements IAuthDataSource
{


SupabaseClient _supabaseClient;

SupabaseDataSource(SupabaseClient sb): _supabaseClient = sb;

  @override
  Future<Userdbmodel> signin(String email, String password) {
    
    throw UnimplementedError();
  }

  @override
  Future<String> signup(String name, String email, String password)async {
      try{ final response = await _supabaseClient.auth.signUp(password: password, email: email,data:{"name":name});
       if(response.user==null){
        throw Exception();
       }
       return response.user!.id;
        }
        catch(e)
        {
          throw Exception();
         
        }
  }

  
}