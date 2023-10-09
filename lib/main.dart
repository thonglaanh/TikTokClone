import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tiktok/screens/auth/introduceScreen.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/main/mainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Check ứng dụng hoạt động đúng
  // Khởi tạo cấu hình cung cập cho firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBLcY5QP8t113KiaGiZSMhhBw9rQmRV-8s",
      appId: "1:847650068201:android:143cc78f88ee3aad1c4278",
      messagingSenderId: "847650068201",
      projectId: "tiktokclone-ed7f0",
    ),
  );
  //FlutterSecureStorage : Kiểu localStorage
  const storage = FlutterSecureStorage();
  String? UID = await storage.read(key: 'uID');
  runApp(MyApp(UID: UID));
}

class MyApp extends StatelessWidget {
  final String? UID;

  const MyApp({Key? key, this.UID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tiktok Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: UID != null ? const MainScreen() : const IntroduceScreen(),
    );
  }
}
