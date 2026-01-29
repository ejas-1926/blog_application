import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/core/usecase/interfaces/usecase.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:blog_application/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class Getcurrentuserusecase implements Usecase<UserModel, Noparams> {
  IAuthRepository repository;

  Getcurrentuserusecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(Noparams p) async {
    return await repository.getcurrentuser();
  }
}

class Noparams {
  Noparams();
}

//if we have no params to pass then just create a class like this no params and pass like this
