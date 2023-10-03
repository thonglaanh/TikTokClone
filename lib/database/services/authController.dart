import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tiktok/database/models/user.modal.dart' as UserModel;
import 'package:tiktok/screens/auth/loginScreen.dart';
import 'package:tiktok/screens/home/homeScreen.dart';
import 'package:tiktok/widgets/snackbar.dart';

class AuthenticationController extends GetxController {
  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;
  late Rx<User?> _currentUser;

  void chooseImageFromGallery() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImageFile != null) {
      Get.snackbar(
        "Profile Image",
        "You have successfully selected profile image",
      );
    }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void createAccountForNewUser(String fullName, String email, String password,
      BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel.UserModel userModel = UserModel.UserModel(
          gender: 'none',
          email: email,
          phone: 'none',
          age: 'none',
          avatarURL:
              'https://iotcdn.oss-ap-southeast-1.aliyuncs.com/RpN655D.png',
          fullName: fullName,
          uid: credential.user!.uid,
          follower: [],
          following: []);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(userModel.toJson());
      getSnackBar("Success", "Register successfully!", Colors.green)
          .show(context);
    } catch (e) {
      getSnackBar("Failed", "Register Failed!", Colors.red).show(context);
    }
  }

  void loginForEmail(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      getSnackBar("Success", "Login successfully!", Colors.green).show(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      getSnackBar("Failed", "Login Failed!", Colors.red).show(context);
    }
  }

  // goToScreen(User? currentUser) {
  //   if (currentUser == null) {
  //     Get.offAll(const LoginScreen());
  //   } else {
  //     Get.offAll(const HomeScreen());
  //   }
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  //   _currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  //   _currentUser.bindStream(FirebaseAuth.instance.authStateChanges());
  //   ever(_currentUser, goToScreen);
  // }
}
