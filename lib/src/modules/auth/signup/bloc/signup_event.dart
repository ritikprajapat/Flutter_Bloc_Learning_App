part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupUserNameEvent extends SignupEvent {
  final String userName;
  SignupUserNameEvent(this.userName);
}

class SignupEmailEvent extends SignupEvent {
  final String email;
  SignupEmailEvent(this.email);
}

class SignupPasswordEvent extends SignupEvent {
  final String password;
  SignupPasswordEvent(this.password);
}

class SignupConfirmPasswordEvent extends SignupEvent {
  final String confirmPassword;
  SignupConfirmPasswordEvent(this.confirmPassword);
}

class SignupPasswordVisibleEvent extends SignupEvent {}

class SignupConfirmPasswordVisibleEvent extends SignupEvent {}
