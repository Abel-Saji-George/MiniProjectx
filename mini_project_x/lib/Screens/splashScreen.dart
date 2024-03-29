import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      duration: 400,

      // animationDuration: ,
      splashIconSize: 200,
      splash: 'materials/symbol.png',

      nextScreen: const HomeScreen(),
      backgroundColor: const Color.fromARGB(31, 21, 1, 1),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      
    );
  }
}
