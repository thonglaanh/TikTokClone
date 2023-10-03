import 'package:flutter/material.dart';
import 'package:tiktok/database/services/authController.dart';
import 'package:tiktok/widgets/buttonAuth.dart';
import 'package:tiktok/widgets/textInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputPasswordController = TextEditingController();
  var authenticationController = AuthenticationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                'Login your account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10, 40, 10, 20),
              height: 50,
              child: TextInputWidget(
                textEditingController: inputEmailController,
                lableString: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextInputWidget(
                textEditingController: inputPasswordController,
                lableString: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: ButtonAuthWidget(
                color: Colors.black,
                label: 'Login',
                onTap: () {
                  if (inputEmailController.text.isNotEmpty &&
                      inputPasswordController.text.isNotEmpty) {
                    authenticationController.loginForEmail(
                        inputEmailController.text,
                        inputPasswordController.text,
                        context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
