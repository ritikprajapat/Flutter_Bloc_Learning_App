part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
  final String? email;
  final String? password;
  final bool isPasswordVisible;
  LoginInitial({
    this.email = "",
    this.password = "",
    this.isPasswordVisible = false,
  });

  LoginInitial copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
  }) {
    return LoginInitial(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
