import 'package:finease/Screens/Auth/registeration_page.dart';
import 'package:finease/Screens/OnBoarding/user_auth_page.dart';
import 'package:finease/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../Utilities/finease_logo.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey<IntroductionScreenState>();
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
              key: introKey,
              globalBackgroundColor: Colors.white,
              allowImplicitScrolling: true,
              //autoScrollDuration: 3000,
              showNextButton: false,
              done: const Text("Done",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              onDone: () => Get.to(() => const UserAuthPage()),
              globalHeader: Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: fineaseLogo(),
                  ),
                ),
              ),
              pages: [
            PageViewModel(
              title: "Welcome",
              body:
                  "FinEase is a modern banking app that simplifies and enhances the banking experience with features for you.\n\n Finance Made Easy",
              image: Lottie.asset('assets/images/finease.json',
                  width: 200, repeat: false),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Pay from one place",
              body:
                  "Streamline your payments with FinEase that lets you pay from a single location, saving time and hassle.",
              image: Lottie.asset('assets/images/card.json', width: 800),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "See and manage your mortgage",
              body:
                  "Stay in control of your mortgage on-the-go with a FinEase that puts your account at your fingertips.",
              image: Lottie.asset('assets/images/Mortgage_Loader.json',
                  width: 800),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "One step solution to your account management",
              body:
                  "Simplify your account management with FinEase that offers a one-step solution to all your financial needs.",
              image: Lottie.asset('assets/images/Global_Solutions.json',
                  width: 200),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Earn interest and rewards",
              body:
                  "Maximize your money with FinEase that lets you earn interest and rewards on your account balances.",
              image: Lottie.asset('assets/images/interest.json', width: 200),
              decoration: pageDecoration,
            ),
          ])),
    );
  }
}
