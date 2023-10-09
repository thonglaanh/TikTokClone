import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/auth/loginScreen.dart';
import 'package:tiktok/screens/auth/registerScreen.dart';

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({Key? key}) : super(key: key);

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/tik-tok.png',
              width: 100,
              height: 100,
            ),
            Container(
              // Thêm margin cho Text
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: const Text(
                'Login in to TikTok',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: const Text(
                'Manage your account, check notifications, comment on videos, stream video and more',
                style: TextStyle(fontSize: 15, color: Color(0xff777777)),
                textAlign: TextAlign.center, // Căn chỉnh văn bản vào giữa
              ),
            ),
            _buildLoginButton(Icons.phone, 'Login with phone number', () {}),
            _buildLoginButton(Icons.email, 'Login with email', () {
              Get.to(const LoginScreen());
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You don't have an account? "),
                InkWell(
                  onTap: () {
                    Get.to(const RegisterScreen());
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(IconData icon, String text, VoidCallback onPressed) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Màu sắc của Button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Border radius cho Button
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            const SizedBox(width: 30),
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
