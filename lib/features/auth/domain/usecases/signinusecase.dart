import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/core/usecase/interfaces/usecase.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:blog_application/features/auth/domain/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class Signinusecase implements Usecase<UserModel, UserSignInparams> {
  final IAuthRepository _repository;
  Signinusecase({required IAuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, UserModel>> call(UserSignInparams p) async {
    return await _repository.signin(email: p.email, password: p.password);
  }
}

class UserSignInparams {
  String email;
  String password;
  UserSignInparams({required this.email, required this.password});
}
