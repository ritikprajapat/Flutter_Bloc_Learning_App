import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_app/src/core/themes/app_styles.dart';
import 'package:learning_app/src/modules/onboarding/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 56,
            ),
            SizedBox(height: 12),
            Text(
              'Learning App',
              style: AppStyles.tsBlackMedium18,
            ),
            SizedBox(height: 12),
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.25),
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
