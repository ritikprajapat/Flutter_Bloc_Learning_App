import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/src/app/bloc_providers.dart';

import '../core/core.dart';
import '../modules/module.dart';

export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart'; 
export '../modules/module.dart';
export '../core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp(
        title: 'Learning App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: false,
        ),
        home: SplashView(),
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
