import 'dart:io';

import 'package:finease/Utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final emailAddress = TextEditingController();
  final phoneNumber = TextEditingController();

  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final zipcode = TextEditingController();

  final govtID = TextEditingController();
  final pancard = TextEditingController();

  final personalFormKey = GlobalKey<FormState>();
  final residentialFormKey = GlobalKey<FormState>();
  final govtFormKey = GlobalKey<FormState>();
  final accFormKey = GlobalKey<FormState>();

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  var loading = false.obs;
  var biometricVerified = 'none'.obs;

  var govtIdImage =Rx<File?>(null);
  var profileImage =Rx<File?>(null);

  Future<bool> requestLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  Future<void> pickImage({bool profile=false}) async {
    final permissionStatus = await Permission.storage.request();
    if (permissionStatus != PermissionStatus.granted) {
      setSnackBar('Error: permission denied', 'We need your storage access to upload the document',icon: const Icon(Icons.warning_amber_rounded));
      return;
    }

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
     setSnackBar('Error: selected none', 'Please upload the image',icon: const Icon(Icons.warning_amber_rounded));
      return;
    }

    if(profile){
      profileImage.value = File(pickedFile.path);
    }else {
      govtIdImage.value = File(pickedFile.path);
    }
  }

  Future<void> setLocation() async {
    if (await requestLocation()) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude,
          localeIdentifier: 'en');

      Placemark placemark = placemarks.first;

      String? stateC = placemark.administrativeArea;
      String? cityC = placemark.locality;
      String? postalCodeC = placemark.postalCode;
      String? countryC = placemark.country;
      String? streetC = placemark.street;

      street.text = streetC!;
      city.text = cityC!;
      state.text = stateC!;
      country.text = countryC!;
      zipcode.text = postalCodeC!;
    } else {
      setSnackBar(
          'Permission denied', 'Please provide us the access to your location');
    }
  }

  Future<String> pickDate(BuildContext context, String format) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final DateFormat formatter = DateFormat(format);
      final String formatted = formatter.format(picked);
      return formatted;
    } else {
      return '';
    }
  }

  @override
  void onInit() async {
    await setLocation();
    super.onInit();
  }
}
