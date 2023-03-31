import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey<IntroductionScreenState>();
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: IntroductionScreen(
        key: introKey,
        
      ))),
    );
  }
}