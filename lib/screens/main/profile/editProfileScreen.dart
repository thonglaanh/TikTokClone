import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/services/userService.dart';
import 'package:tiktok/widgets/buttonAuth.dart';
import 'package:tiktok/widgets/textInput.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  List<String> genders = ['Male', 'Female', 'Other'];
  String? selectedGender;

  doEdit(BuildContext context) {
    UserService.editUser(
        context: context,
        phone: phone.text,
        fullName: fullName.text,
        gender: selectedGender,
        age: age.text,
        email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.getUserInfo(), //1
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          fullName.text = snapshot.data['fullName'] ?? '';
          email.text = snapshot.data['email'] ?? '';
          phone.text = snapshot.data['phone'] ?? '';
          age.text = snapshot.data['age'] ?? '';
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              title: const Text(
                'Edit profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment
                          .bottomRight, // Đặt nút "edit" ở góc trên bên phải
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            // '${snapshot.data.get('avatarURL')}',
                            'images/tik-tok.png',
                            height: 100,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50,
                              left:
                                  20), // Điều chỉnh khoảng cách từ góc trên bên phải
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Giới thiệt về bản thân',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: TextInputWidget(
                          textEditingController: fullName,
                          iconData: Icons.near_me,
                          lableString: "Full name",
                          isObscure: false),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: TextInputWidget(
                          textEditingController: email,
                          iconData: Icons.email,
                          lableString: "Email",
                          isObscure: false),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: TextInputWidget(
                          textEditingController: phone,
                          iconData: Icons.phone,
                          lableString: "Phone",
                          isObscure: false),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        hint: const Text(
                            'Select Gender'), // Text mặc định khi chưa chọn
                        onChanged: (newValue) {
                          setState(() {
                            selectedGender =
                                newValue; // Cập nhật giới tính đã chọn
                          });
                        },
                        items: genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: "Gender",
                          prefixIcon:
                              const Icon(Icons.person), // Icon phía trước
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: TextInputWidget(
                          textEditingController: age,
                          iconData: Icons.date_range,
                          lableString: "Age",
                          isObscure: false),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.25,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.25,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                doEdit(context);
                              },
                              child: const Text('Edit')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
