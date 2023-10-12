import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/screens/main/mainScreen.dart';
import 'package:tiktok/widgets/snackbar.dart';

class UserService {
  //Lấy user ra từ id của user trong FlutterSecureStorage
  static Future getUserInfo() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    const storage = FlutterSecureStorage();
    String? UID = await storage.read(key: 'uID');
    final result = await users.doc(UID).get();
    return result;
  }

  static editUser(
      {required BuildContext context,
      required age,
      required gender,
      required phone,
      required fullName,
      required email}) async {
    try {
      //Sửa user từ id user trong FlutterSecureStorage
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      const storage = FlutterSecureStorage();
      String? UID = await storage.read(key: 'uID');
      users.doc(UID).update({
        'fullName': fullName,
        'age': age,
        'phone': phone,
        'gender': gender,
        'email': email
      });
      await getSnackBar(
        'Edit Info',
        'Edit Success.',
        Colors.green,
      ).show(context);
      Get.to(const MainScreen());
    } catch (e) {
      getSnackBar(
        'Edit Info',
        'Edit Fail. $e',
        Colors.red,
      ).show(context);
      print(e);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
    } else {}
  }
}
