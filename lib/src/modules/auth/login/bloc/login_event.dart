part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class EmailEvent extends LoginEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent(this.password);
}

class loginPasswordVisibleEvent extends LoginEvent {}
