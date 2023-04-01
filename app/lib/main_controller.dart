import 'package:finease/Screens/OnBoarding/user_auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     Get.off(() => UserAuthPage());
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
    debugPrint(FirebaseAuth.instance.currentUser?.emailVerified.toString());
    super.onInit();
  }
}
