import 'package:finease/Screens/Auth/auth_controller.dart';
import 'package:finease/Screens/Auth/legal_page.dart';
import 'package:finease/Themes/themes.dart';
import 'package:finease/Utilities/finease_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Utilities/app_bar_widget.dart';
import '../../Utilities/custom_sizebox.dart';
import '../../Utilities/text_field.dart';

class ResidentialPageScreen extends GetView<AuthController> {
  const ResidentialPageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final regSteps = 2;
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
                    'Residential Details',
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
                            key: controller.residentialFormKey,
                            child: Column(
                              children: [
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                    },
                                    controller: controller.street,
                                    icon: Icons.home,
                                    label: 'Street Address'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your city';
                                      }
                                    },
                                    controller: controller.city,
                                    icon: Icons.map_outlined,
                                    label: 'City'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your State';
                                      }
                                    },
                                    controller: controller.state,
                                    icon: Icons.location_on_outlined,
                                    label: 'State'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your Country';
                                      }
                                    },
                                    controller: controller.country,
                                    icon: Icons.flag_outlined,
                                    label: 'Country'),
                                textField(
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Please enter your Zip Code';
                                      }
                                    },
                                    controller: controller.zipcode,
                                    icon: Icons.my_location_outlined,
                                    label: 'zipcode'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Legal\nInformation',
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
                                                    .residentialFormKey
                                                    .currentState!
                                                    .validate())
                                                  Get.to(() =>
                                                      const LegalPageScreen())
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
