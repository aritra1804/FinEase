import 'package:finease/Utilities/app_bar_widget.dart';
import 'package:flutter/material.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fineaseAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

          ],
        ),
      )),
    );
  }
}