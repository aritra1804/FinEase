import 'package:finease/Screens/Auth/auth_controller.dart';
import 'package:finease/Screens/Auth/residential_page.dart';
import 'package:finease/Themes/themes.dart';
import 'package:finease/Utilities/app_bar_widget.dart';
import 'package:finease/Utilities/custom_sizebox.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:finease/Utilities/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utilities/finease_logo.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<AuthController>(AuthController());
    // regSteps = 1;
    return Scaffold(
      appBar: fineaseAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizeBox(20, 0),
                  Text(
                    'Login',
                    style: Get.theme.kMedTitleTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 20, left: 20, right: 20),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Get.theme.curveBG,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                            key: controller.personalFormKey,
                            child: Column(
                              children: [
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your Account Number';
                                      }
                                    },
                                    controller: controller.accountno,
                                    icon: Icons.card_giftcard,
                                    label: 'Account Number'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your MPIN';
                                      }
                                    },
                                    controller: controller.mpin,
                                    icon: Icons.person_outlined,
                                    label: 'MPIN'),
                                
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Residential\nInformation',
                                        style: Get.theme.kMedTitleTextStyle,
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Get.theme.colorAccent),
                                      child: IconButton(
                                          onPressed: () => {
                                                if (controller.personalFormKey
                                                    .currentState!
                                                    .validate())
                                                  {
                                                    controller.createAccount().then(
                                                        (value) => Get.to(() =>
                                                            const ResidentialPageScreen()))
                                                  }
                                              },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Get.theme.btnTextCol,
                                            size: 20,
                                          )),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
