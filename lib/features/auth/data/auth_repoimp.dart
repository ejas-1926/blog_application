import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoimp implements IAuthRepository {

 IAuthDataSource authDataSource;


  //constructor
  AuthRepoimp(this.authDataSource);

 
  

  @override
  Future<Either<Failure, String>> signup ({required String name, required String email, required String password}) async {
try
{
final userid = await authDataSource.signup(name, email, password);
return right(userid);
}

catch(e)
{
   return left(Failure(e.toString()));
}
   
  }
  
  @override
  Future<Either<Failure, String>> signin({required String email, required String password}) {
    
    throw UnimplementedError();
  }
}


//we should not force what dbsoruce is giving 
//see our business logic needs only string during sign up that is the name 
//but the data source is giving the full thing what we want is only we are taking from here that is the part of business logic
//not the data source logic ie dont push what we want just take and modify accordingly
