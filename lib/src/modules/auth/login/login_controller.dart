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
        } else if (password!.isEmpty) {}

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password ?? '');
          var user = credential.user;
          if (user == null) {
          } else if (!user.emailVerified) {}
          if (user != null) {
          } else {}
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print('No User');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided');
          } else if (e.code == 'invalid-email') {
            print('Invalid Email');
          }
        }
      }
    } catch (e) {}
  }
}
