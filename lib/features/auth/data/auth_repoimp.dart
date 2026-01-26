import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/features/auth/data/datasource/auth_datasource.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:blog_application/features/auth/domain/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoimp implements IAuthRepository {
  IAuthDataSource authDataSource;

  //constructor
  AuthRepoimp(this.authDataSource);

  @override
  Future<Either<Failure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await authDataSource.signup(name, email, password);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signin({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await authDataSource.signin(email, password);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}


//we should not force what dbsoruce is giving 
//see our business logic needs only string during sign up that is the name 
//but the data source is giving the full thing what we want is only we are taking from here that is the part of business logic
//not the data source logic ie dont push what we want just take and modify accordingly
