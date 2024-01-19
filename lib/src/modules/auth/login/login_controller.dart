import 'package:learning_app/src/app/app.dart';

import 'bloc/login_bloc.dart';

class LoginController {
  final BuildContext context;
  const LoginController(this.context);

  void handleLogin(String type) {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        var emaiAddress = state.email;
        var password = state.password;
      }
    } catch (e) {}
  }
}
