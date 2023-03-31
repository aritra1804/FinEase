import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finease/Themes/themes.dart';


bottomSheetWidget(Widget data,
    {bool dismissible = true, double initialChild = 0.75,FutureOr<void> Function()? onExit,}) {
  Get.bottomSheet(
      SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.2,
            initialChildSize: initialChild,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Get.theme.sheetColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // BackdropFilter(
                    //   filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    //   child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 32,
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                        ),
                        data
                      ],
                    ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Get.theme.barrierColor,
      useRootNavigator: true,
      isDismissible: dismissible,
      enableDrag: dismissible,
      isScrollControlled: true
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      ,).whenComplete(onExit??()=>{});
}

nonDissmisibleSheet(
  Widget data, {
  VoidCallback? onDismiss,
  bool draggable = true,
}) {
  Get.bottomSheet(
          SafeArea(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: WillPopScope(
                  onWillPop: (() => Future.value(false)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Get.theme.sheetColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // BackdropFilter(
                        //   filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                        //   child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 32,
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                            ),
                            data
                          ],
                        ),
                        // ),
                      ],
                    ),
                  )),
            ),
          ),
          backgroundColor: Colors.transparent,
          barrierColor: Get.theme.barrierColor,
          useRootNavigator: true,
          isDismissible: false,
          enableDrag: draggable
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          )
      .whenComplete(onDismiss ?? () => {});
}
