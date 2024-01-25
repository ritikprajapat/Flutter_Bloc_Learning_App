import '../../app/app.dart';

class AppRoutes {
  static getRoutes() {
    return {
      "loginView": (context) => LoginView(),
      "signUpView": (context) => SignUpView(),
      "homeView": (context) => HomeView(),
    };
  }
}