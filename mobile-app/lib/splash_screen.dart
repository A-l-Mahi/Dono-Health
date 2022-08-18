import 'package:flutter/material.dart';

import 'configs/SizeConfig.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Center(
            child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(OnboardingScreen.routeName);
      },
      child: Image.asset(
        'assets/images/logo.png',
        width: SizeConfig.safeBlockHorizontal * 60,
      ),
    )));
  }
}
