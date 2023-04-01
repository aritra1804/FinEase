import 'package:finease/Screens/Auth/login_page_screen.dart';
import 'package:finease/Screens/Auth/registeration_page.dart';
import 'package:finease/Themes/themes.dart';
import 'package:finease/Utilities/app_bar_widget.dart';
import 'package:finease/Utilities/custom_sizebox.dart';
import 'package:finease/Utilities/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utilities/secondary_button.dart';

class UserAuthPage extends StatelessWidget {
  const UserAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fineaseAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            sizeBox(50, 0),
            SvgPicture.asset(
              'assets/images/obj.svg',
              height: 300,
            ),
            Text(
              "Let's get started!",
              style: Get.theme.kTitleTextStyle,
            ),
            sizeBox(30, 0),
            primaryButton(
                label: 'Login to your account',
                icon: Icons.login_rounded,
                onTap: () => Get.to(() => const LoginPageScreen())),
            secondaryButton(
                label: 'Sign up',
                icon: Icons.create,
                onTap: () => Get.to(() => const RegisterPageScreen())),
          ],
        ),
      )),
    );
  }
}
