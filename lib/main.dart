import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/screens/auth/introduceScreen.dart';
import 'package:tiktok/screens/home/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBLcY5QP8t113KiaGiZSMhhBw9rQmRV-8s",
      appId: "1:847650068201:android:143cc78f88ee3aad1c4278",
      messagingSenderId: "847650068201",
      projectId: "tiktokclone-ed7f0",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tiktok Clone',
      debugShowCheckedModeBanner: false,
      home: IntroduceScreen(),
    );
  }
}
