import 'package:finease/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/obj.svg',
              width: 200,
            ),
            Text(
              'Email Sent',
              style: Get.theme.kTitleTextStyle,
            ),
            Text(
              'Please check your email for a link to reset your password and verify the same',
              style: Get.theme.kSubTitleTextStyle,
            ),
          ],
        ),
      ),
    ));
  }
}
