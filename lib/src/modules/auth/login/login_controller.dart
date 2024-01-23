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
        String? email = state.email;
        String? password = state.password;

        if (email!.isEmpty) {
          log('email Empty');
        } else if (password!.isEmpty) {
          log('password Empty');
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password ?? '',
          );
          var user = credential.user;
          if (user == null) {
            log('User does not exist');
          } else if (!user.emailVerified) {
            log('user Verified');
          }
          if (user != null) {
            log('User Exist');
          } else {
            log('No User');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            log('No User');
          } else if (e.code == 'wrong-password') {
            log('Wrong password provided');
          } else if (e.code == 'invalid-email') {
            log('Invalid Email');
          }
        }
      }
    } catch (e) {}
  }
}
