import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Themes/themes.dart';

Widget textField(
    {required String? Function(String?) validator,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboard,
    Function()? onTap,
    bool obscureText = false,
    bool enableSuggestions = true,
    bool autoCorrect = true,
    bool readOnly = false,
    required String label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    child: TextFormField(
      scrollPhysics: const BouncingScrollPhysics(),
      keyboardType: keyboard,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      onTap: onTap,
      autocorrect: autoCorrect,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          // color: Get.theme.btnTextCol,
        ),
        // icon: Icon(
        //   icon,
        //   color: Get.theme.btnTextCol,
        // ),
        labelText: label,
      ),
    ),
  );
}
