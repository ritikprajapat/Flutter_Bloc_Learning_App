import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/src/app/app.dart';

class SignupController {
  final BuildContext context;
  const SignupController(this.context);

  void handleSignUp() async {
    final state = context.read<SignupBloc>().state;

    String? userName = state.userName ?? '';
    String? email = state.email ?? '';
    String? password = state.password ?? '';
    String? confirmPassword = state.confirmPassword ?? '';

    if (userName.isEmpty) {
      SnackbarHelper.showSnackbar(context, 'Please enter your Username');
    } else if (email.isEmpty) {
      SnackbarHelper.showSnackbar(context, 'Please enter your Email Address');
    } else if (password.isEmpty) {
      SnackbarHelper.showSnackbar(context, 'Please enter your password');
    } else if (confirmPassword.isEmpty) {
      SnackbarHelper.showSnackbar(context, 'Please enter your Confirm Password');
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        SnackbarHelper.showSnackbar(context, 'An Email has been sent to your registered email.');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        SnackbarHelper.showSnackbar(context, 'The password provided is too weak');
      } else if (e.code == "email-already-in-use") {
        SnackbarHelper.showSnackbar(context, 'The email is already in  use');
      } else if (e.code == "invalid-email") {
        SnackbarHelper.showSnackbar(context, 'your email id is invalid email');
      }
    }
  }
}
