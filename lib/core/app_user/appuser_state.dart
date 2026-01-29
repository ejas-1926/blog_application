part of 'appuser_cubit.dart';

@immutable
sealed class AppuserState {}

final class AppuserInitial extends AppuserState {}

final class Appuserloggedin extends AppuserState {
  final UserModel user;
  Appuserloggedin(this.user);
}
