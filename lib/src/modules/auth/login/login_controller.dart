import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/src/app/app.dart';

class LoginController {
  final BuildContext context;
  const LoginController(this.context);

  Future<void> handleLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email ?? '';
        String password = state.password ?? '';

        if (email.isEmpty) {
          SnackbarHelper.showSnackbar(context, 'Please enter your Email Address');
        } else if (password.isEmpty) {
          SnackbarHelper.showSnackbar(context, 'Please enter your Password');
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          var user = credential.user;

          if (user == null) {
            SnackbarHelper.showSnackbar(context, "User doesn't exist");
          } else if (!user.emailVerified) {
            SnackbarHelper.showSnackbar(context, 'Please verify your email account');
          }

          if (user != null) {
            log('User exist');
          } else {
            SnackbarHelper.showSnackbar(context, "You're not currently a user of this app");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            SnackbarHelper.showSnackbar(context, 'No user found for this email');
          } else if (e.code == 'wrong-password') {
            log('ff');
            SnackbarHelper.showSnackbar(context, 'Incorrect password. Please check your password');
          } else if (e.code == 'invalid-email') {
            SnackbarHelper.showSnackbar(context, 'Invalid Email');
          }
        }
      }
    } catch (e) {}
  }
}
