part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
  final String? email;
  final String? password;

  LoginInitial({
    this.email = "",
    this.password = "",
  });
}
