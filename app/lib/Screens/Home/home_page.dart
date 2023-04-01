import 'package:carousel_slider/carousel_slider.dart';
import 'package:finease/Themes/themes.dart';
import 'package:finease/Utilities/custom_sizebox.dart';
import 'package:finease/Utilities/finease_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_action/slide_action.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: fineaseAppBar(),
        body: SafeArea(
            child: Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.theme.colorSecondaryDark,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hi, Harsh',
                    style: Get.theme.kTitleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'What would you like to do today?',
                    style: Get.theme.kSubTitleTextStyle,
                  ),
                ),
                sizeBox(20, 0),
                Expanded(
                  child: SlideAction(
                    trackBuilder: ((context, currentState) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Balance: \$10520  Swipe to transfer",
                            style: Get.theme.kSmallTextStyle,
                          ),
                        ),
                      );
                    }),
                    thumbBuilder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Get.theme.colorAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    action: () {
                      debugPrint("Hello World");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        sizeBox(50, 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Get.theme.colorSecondary,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 200,
                  ),
                  sizeBox(20, 0),
                  Text(
                    '**** **** **** 3241',
                    style: Get.theme.kMedTitleTextStyle,
                  ),
                  sizeBox(20, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'HARSH KOTHARI',
                        style: Get.theme.kSubTitleTextStyle,
                      ),
                      Text(
                        '03/25',
                        style: Get.theme.kSubTitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          primary: false,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Get.theme.colorPrimaryDark,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.qr_code_2_rounded,
                        color: Get.theme.colorSecondary,
                      )),
                ),
                sizeBox(0, 20),
                TextButton.icon(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Get.theme.colorPrimaryDark,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () => {},
                    icon: Icon(
                      Icons.currency_rupee_rounded,
                      color: Get.theme.colorSecondary,
                    ),
                    label: Text(
                      'Pay',
                      style: Get.theme.kSubTitleTextStyle
                          .copyWith(color: Get.theme.colorSecondary),
                    )),
                sizeBox(0, 20),
                TextButton.icon(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Get.theme.colorPrimaryDark,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () => {},
                    icon: Icon(
                      Icons.bar_chart_rounded,
                      color: Get.theme.colorSecondary,
                    ),
                    label: Text(
                      'Invest and Mutual Funds',
                      style: Get.theme.kSubTitleTextStyle
                          .copyWith(color: Get.theme.colorSecondary),
                    )),
              ],
            ),
          ),
        ),
        
        // CarouselSlider(
        //   options: CarouselOptions(
        //     height: 180.0,
        //     enlargeCenterPage: true,
        //     autoPlay: false,
        //     initialPage: 0,
        //     scrollPhysics: const BouncingScrollPhysics(),
        //     aspectRatio: 16 / 9,
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     enableInfiniteScroll: true,
        //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //     viewportFraction: 0.4,
        //   ),
        //   items: [1, 2, 3].map((i) {
        //     return ClipRRect(
        //       borderRadius: BorderRadius.circular(25.0),
        //       child: Image.asset(
        //         'assets/images/card$i.png',
        //         fit: BoxFit.cover,
        //       ),
        //     );
        //   }).toList(),
        // )
      ],
    )));
  }
}
