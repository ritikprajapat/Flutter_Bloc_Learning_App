import 'dart:developer';

import 'package:learning_app/src/app/app.dart';

class PageEntity {
  String? route;
  Widget? page;
  dynamic bloc;
  PageEntity({
    this.route,
    this.page,
    this.bloc,
  });
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: SplashView(),
        bloc: BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.onboarding,
        page: OnBoardingView(),
        bloc: BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.login,
        page: LoginView(),
        bloc: BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.signup,
        page: SignUpView(),
        bloc: BlocProvider(
          create: (context) => SignupBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.dashboard,
        page: DashboardView(),
        bloc: BlocProvider(
          create: (context) => DashboardBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.home,
        page: HomeView(),
        bloc: BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocsProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        log('First Log');
        log(result.first.route ?? '');
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(builder: (_) => DashboardView(), settings: settings);
          }
          log('Second Log');
          return MaterialPageRoute(builder: (_) => LoginView(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page ?? LoginView(), settings: settings);
      }
    }
    log('InValid Route ${settings.name}');
    return MaterialPageRoute(builder: (_) => LoginView(), settings: settings);
  }
}
