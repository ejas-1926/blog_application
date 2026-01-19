part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUpEvent extends AuthEvent{
  final String name;
  final String email;
  final String password;
  AuthSignUpEvent({required this.name,required this.email,required this.password});
}
class AuthSigninEvent extends AuthEvent{}



