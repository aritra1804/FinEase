import 'dart:async';

import 'package:finease/Screens/Auth/registeration_page.dart';
import 'package:finease/Screens/Home/home_page.dart';
import 'package:finease/Screens/OnBoarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../firebase_options.dart';
import 'Themes/theme_service.dart';
import 'Themes/themes.dart';
import 'getx_bindings.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //   await FirebaseAppCheck.instance.activate(
    //   androidProvider: AndroidProvider.debug,
    // );
    await GetStorage.init();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor:
    //         Get.isDarkMode ? const Color(0xff000000) : const Color(0xffffffff),
    //     statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // AwesomeNotifications().initialize(null, [
    //   NotificationChannel(
    //     channelKey: 'edu_notification',
    //     channelName: 'Edu notifications',
    //     channelDescription: 'Education related notifications',
    //     defaultColor: const Color(0xff66DA40),
    //     ledColor: Colors.green,
    //     importance: NotificationImportance.High,
    //     playSound: true,
    //     enableLights: true,
    //     enableVibration: true,
    //   )
    // ]);

    runApp(MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appdata = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 800),
      // transitionDuration: const Duration(milliseconds: 800),
      initialBinding: ControllerBindings(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      debugShowCheckedModeBanner: false,
      // getPages: [
      //   GetPage(name: '/', page: () => WebStrakeApp()),
      //   GetPage(name: '/badge', page: () => BadgeScreen()),
      //   GetPage(name: '/state', page: () => StateSelector()),
      //   GetPage(name: '/browser', page: () => WebStrakeBrowser()),
      // ],
      home: checkUser(),
    );
  }
}

Widget checkUser() {
  return FirebaseAuth.instance.currentUser!.emailVerified 
      ? const RegisterPageScreen()
      : const OnBoardingScreen();
}
