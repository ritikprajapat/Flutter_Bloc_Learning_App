import 'app.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
      ];
}
