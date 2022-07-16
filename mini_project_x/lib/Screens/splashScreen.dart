import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      // animationDuration: ,
      splashIconSize: 200,
      splash: 'materials/symbol.png',

      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}
