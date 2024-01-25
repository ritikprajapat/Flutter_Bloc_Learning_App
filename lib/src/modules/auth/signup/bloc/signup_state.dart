part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {
  final String? userName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  SignupInitial({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  SignupInitial copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return SignupInitial(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}
