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

class RegisterPageScreen extends StatelessWidget {
  const RegisterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<AuthController>(AuthController());
    final regSteps = 1;
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
                    'Peronal Details',
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
                                        return 'Please enter your first name';
                                      }
                                    },
                                    controller: controller.firstName,
                                    icon: Icons.person_outlined,
                                    label: 'First Name'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                    },
                                    controller: controller.lastName,
                                    icon: Icons.person_outlined,
                                    label: 'Last Name'),
                                textField(
                                    validator: (v) {},
                                    readOnly: true,
                                    onTap: () async {
                                      final String selectedDate =
                                          await controller.pickDate(
                                              context, 'dd/MM/yyyy');
                                      controller.dateOfBirth.text =
                                          selectedDate;
                                    },
                                    controller: controller.dateOfBirth,
                                    icon: Icons.calendar_today_outlined,
                                    label: 'Date of Birth'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your email address';
                                      } else if (!GetUtils.isEmail(v)) {
                                        return 'Please enter a valid email address';
                                      }
                                    },
                                    controller: controller.emailAddress,
                                    icon: Icons.email_outlined,
                                    label: 'Email Address'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your phone number';
                                      } else if (!GetUtils.isPhoneNumber(v)) {
                                        return 'Please enter a valid phone number';
                                      }
                                    },
                                    controller: controller.phoneNumber,
                                    icon: Icons.phone_android_outlined,
                                    label: 'Phone Number'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter this field';
                                      }
                                    },
                                    controller: controller.gender,
                                    icon: Icons.male_outlined,
                                    label: 'Gender'),
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
