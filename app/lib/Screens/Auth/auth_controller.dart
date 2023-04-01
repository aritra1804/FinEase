import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:finease/Models/pic_model.dart';
import 'package:finease/Models/user_data.dart';
import 'package:finease/Utilities/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart';
import 'package:finease/globals.dart';

class AuthController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final emailAddress = TextEditingController();
  final phoneNumber = TextEditingController();
  final gender = TextEditingController();

  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final zipcode = TextEditingController();

  final accountno = TextEditingController();
  final mpin = TextEditingController();

  final govtID = TextEditingController();

  final personalFormKey = GlobalKey<FormState>();
  final residentialFormKey = GlobalKey<FormState>();
  final govtFormKey = GlobalKey<FormState>();
  final accFormKey = GlobalKey<FormState>();

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  var loading = false.obs;
  var biometricVerified = 'none'.obs;

  var govtIdImage = Rx<File?>(null);
  var profileImage = Rx<File?>(null);

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

  Future<void> pickImage({bool profile = false}) async {
    final permissionStatus = await Permission.storage.request();
    if (permissionStatus != PermissionStatus.granted) {
      setSnackBar('Error: permission denied',
          'We need your storage access to upload the document',
          icon: const Icon(Icons.warning_amber_rounded));
      return;
    }

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      setSnackBar('Error: selected none', 'Please upload the image',
          icon: const Icon(Icons.warning_amber_rounded));
      return;
    }

    if (profile) {
      profileImage.value = File(pickedFile.path);
      uploadImage('profile', profileImage.value!);
    } else {
      govtIdImage.value = File(pickedFile.path);
      uploadImage('photoProof', govtIdImage.value!);
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

  Future<void> sendData() async {
    try {
      final data = UserData(
        firstName: firstName.text,
        lastName: lastName.text,
        DOB: dateOfBirth.text,
        email: emailAddress.text,
        phone: phoneNumber.text,
        street: street.text,
        city: city.text,
        state: state.text,
        country: country.text,
        pincode: zipcode.text,
        governmentIdNumber: govtID.text,
        uid: FirebaseAuth.instance.currentUser!.uid,
        gender: gender.text,
        token: await FirebaseMessaging.instance.getToken(),
      );
      final apiUrl = "${Globals.APIURL}/users/register";
      final response = await post(Uri.parse(apiUrl), body: data.toJson());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var accessToken = responseBody['data']['accessToken'];
        GetStorage().write('accessToken', accessToken);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage(String type, File file) async {
    final bytes = await file.readAsBytesSync();
    String image = base64Encode(bytes);
    print(image);
    print(FirebaseAuth.instance.currentUser!.uid);
    try {
      final apiUrl = "${Globals.APIURL}/image/add";
      final response = await post(Uri.parse(apiUrl),
          headers: {
            "content-type": "application/json; charset=utf-8",
          },
          body: jsonEncode(<String, String>{
            "userId": FirebaseAuth.instance.currentUser!.uid,
            "image": image,
            "photoName": type,
          }));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        print(responseBody);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> verifyBiometric() async {
    try {
      final apiUrl = Globals.BIOURL;
      final user = UserVerify(
        userId: FirebaseAuth.instance.currentUser!.uid,
      );
      final response = await post(Uri.parse(apiUrl),
          body: jsonEncode(<String, String>{
            "body": FirebaseAuth.instance.currentUser!.uid,
          }));
      var responseBody = jsonDecode(response.body);
      debugPrint(responseBody.toString());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        debugPrint(responseBody);
        // var status = responseBody[0].Status;
        debugPrint(responseBody[0].Status);
        var status = true;
        if (status == true) {
          biometricVerified.value = 'success';
          return true;
        } else {
          biometricVerified.value = 'failed';
          setSnackBar('ERROR: ',
              'Invalid match please try again by reuploading the right image');
          return false;
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  String generatePassword() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(Iterable.generate(
        8, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  Future<void> createAccount() async {
    loading.value = true;
    // await Future.delayed(const Duration(seconds: 2));
    // setSnackBar('Success', 'Account created successfully');
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress.text,
        password: generatePassword(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setSnackBar('Auth Error: ', 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        setSnackBar(
            'Auth Error: ', 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await setLocation();
    super.onInit();
  }
}
