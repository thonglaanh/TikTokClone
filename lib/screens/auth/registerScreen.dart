import 'package:flutter/material.dart';
import 'package:tiktok/database/services/authController.dart';
import 'package:tiktok/widgets/buttonAuth.dart';
import 'package:tiktok/widgets/textInput.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputFullNameController = TextEditingController();
  TextEditingController inputPasswordController = TextEditingController();
  TextEditingController inputConfirmPasswordController =
      TextEditingController();
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
                'Register account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10, 40, 10, 15),
              child: TextInputWidget(
                textEditingController: inputFullNameController,
                lableString: "Full name",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: TextInputWidget(
                textEditingController: inputEmailController,
                lableString: "Email",
                iconData: Icons.lock_outline,
                isObscure: false,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: TextInputWidget(
                textEditingController: inputPasswordController,
                lableString: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: TextInputWidget(
                textEditingController: inputConfirmPasswordController,
                lableString: "Confirm password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: ButtonAuthWidget(
                color: Colors.black,
                label: 'Register',
                onTap: () {
                  if (inputEmailController.text.isNotEmpty &&
                      inputEmailController.text.isNotEmpty &&
                      inputPasswordController.text.isNotEmpty) {
                    authenticationController.createAccountForNewUser(
                        inputFullNameController.text,
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
