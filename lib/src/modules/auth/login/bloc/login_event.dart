part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginTextChangedEvent(this.email, this.password);
}
