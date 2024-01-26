import 'package:learning_app/src/modules/dashboard/view/dashboard_view.dart';

import '../../app/app.dart';

class AppRoutes {
  static getRoutes() {
    return {
      "loginView": (context) => LoginView(),
      "signUpView": (context) => SignUpView(),
      "dashboard": (context) => DashboardView(),
    };
  }
}
