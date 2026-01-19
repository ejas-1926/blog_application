import 'package:blog_application/core/error/failure.dart';
import 'package:blog_application/core/usecase/interfaces/usecase.dart';
import 'package:blog_application/features/auth/domain/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class Signupusecase implements Usecase<String,UserSignUpParameter> {
  
  final IAuthRepository _authRepository;
  
  Signupusecase({required IAuthRepository authRepository}):_authRepository = authRepository;
  
  
  @override
  Future<Either<Failure, String>> call(UserSignUpParameter p) async {

   return await _authRepository.signup(email: p.email,name: p.name,password: p.password);
  }



}

//Each use case will do something 
//it will return an output 
//it will take some parameter 
//that is why we kept it as generic as this will keep on changing for different use cases


class UserSignUpParameter
{
final String name;
final String email;
final String password;

UserSignUpParameter({required this.email,required this.name,required this.password});

}
