import 'package:finease/Screens/Auth/auth_controller.dart';
import 'package:finease/Screens/Home/home_page.dart';
import 'package:finease/Themes/themes.dart';
import 'package:finease/Utilities/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Utilities/custom_sizebox.dart';
import '../../Utilities/primary_button.dart';
import '../../Utilities/text_field.dart';
import 'package:lottie/lottie.dart';

class BiometricVerificationScreen extends GetView<AuthController> {
  const BiometricVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put<AuthController>(AuthController());
    final regSteps = 4;
    return Scaffold(
      appBar: fineaseAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizeBox(20, 0),
                  Hero(
                    tag: 'steps',
                    child: CircularStepProgressIndicator(
                      totalSteps: 4,
                      currentStep: regSteps,
                      stepSize: 2,
                      unselectedStepSize: 5,
                      selectedColor: Get.theme.colorPrimaryDark,
                      unselectedColor: Colors.grey[200],
                      padding: 0,
                      width: 100,
                      height: 100,
                      selectedStepSize: 6,
                      roundedCap: (_, __) => true,
                      child: Center(
                        child: Text(
                          regSteps.toString(),
                          style: Get.theme.kMedTitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                  sizeBox(5, 0),
                  Text(
                    'Biometric Verification',
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
                            key: controller.accFormKey,
                            child: Column(
                              children: [
                                Obx(() => controller.profileImage.value != null
                                    ? controller.loading.value
                                        ? Lottie.asset(
                                            'assets/images/finease.json')
                                        : Image.file(
                                            controller.profileImage.value!)
                                    : Icon(Icons.account_circle_outlined,
                                        size: 200,
                                        color: Get.theme.btnTextCol)),
                                primaryButton(
                                    label: 'Upload your profile',
                                    icon: Icons.upload,
                                    onTap: () =>
                                        {controller.pickImage(profile: true)}),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter this field';
                                      }
                                    },
                                    controller: controller.password,
                                    icon: Icons.key_rounded,
                                    label: 'Create Password'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter this field';
                                      }
                                    },
                                    obscureText: true,
                                    controller: controller.confirmPassword,
                                    icon: Icons.key_outlined,
                                    label: 'Confirm password'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Account\nCreation',
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
                                                if (controller
                                                    .accFormKey.currentState!
                                                    .validate())
                                                  {
                                                    if (controller
                                                            .password.text ==
                                                        controller
                                                            .confirmPassword
                                                            .text)
                                                      {
                                                        
                                                      }
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
