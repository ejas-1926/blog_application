import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/data/models/userdbmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource implements IAuthDataSource {
  final SupabaseClient _supabaseClient;

  Session? get currentsession => _supabaseClient.auth.currentSession;

  //Constructor
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

  @override
  Future<Userdbmodel?> getCurrentuser() async {
    try {
      var userlist = await _supabaseClient
          .from('profiles')
          .select()
          .eq('id', currentsession!.user.id);
      return Userdbmodel.fromjson(
        userlist.first,
      ).copywith(email: currentsession!.user.email);
    } catch (e) {
      throw Exception();
    }
  }
}

//we are throwing the exception twice ie in the catch block as well
//so that this value will be thrown again at the higher level above this

///
///  _supabaseClient.from('profiles').select(*) here the first part is the table
/// this is same like sql eq is similar to the where clause in sql we can mentioncolumn and value 
///  SELECT * FROM PROFILES WHERE ID = currentsession!.user.id; the above statement look something similar to this
/// 
/// * part is the column names that you want default is * and you can mention the columns like this 'id,value'

//here you can see that once we put fetch the values there can be multiple rows possible 
//that is why the await is returning a list of Map of data



///Getters explained
/////getters are functions in dart.
//they return a value but they are being accessed like properties/variables.