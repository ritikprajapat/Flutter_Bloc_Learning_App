import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';

export '../core/core.dart';
export '../modules/module.dart';
export 'package:flutter/material.dart';
export 'package:learning_app/global.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:firebase_auth/firebase_auth.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...AppPages.allBlocsProviders(context),
      ],
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
        onGenerateRoute: AppPages.GenerateRouteSettings,
      ),
    );
  }
}
