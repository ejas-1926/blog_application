import 'package:blog_application/features/auth/data/models/userdbmodel.dart';

abstract interface class IAuthDataSource
{

Future<Userdbmodel> signin(String email,String password);
Future<String> signup(String name,String email, String password);
}



//this is used for getting data from the data source only
//and get it to the user
