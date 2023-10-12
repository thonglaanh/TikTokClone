import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/services/userService.dart';
import 'package:tiktok/screens/main/profile/editProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/arrow.png',
                      width: 20,
                      height: 20,
                    ),
                    // const Text(
                    //   'Me',
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    // ),
                    Image.asset(
                      'images/menu.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      // Hiển thị thông tin cá nhân ở đây
                      Stack(
                        alignment: Alignment
                            .bottomRight, // Đặt nút "edit" ở góc trên bên phải
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              '${snapshot.data.get('avatarURL')}',
                              // 'images/tik-tok.png',
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
                      const SizedBox(height: 20),
                      Text(
                        '${snapshot.data.get('fullName')}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${snapshot.data.get('email')}',
                        style: const TextStyle(
                            color: Color(0xff777777), fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                      // Hiển thị các số liệu khác ở đây
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '48',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff444444)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '14',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff444444)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '91',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xff444444)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 22),
                            ),
                            onPressed: () {
                              // Xử lý khi button được nhấn
                              Get.to(const EditProfileScreen());
                            },
                            child: const Text(
                              'Edit profile',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                              ),
                              onPressed: () {
                                // Xử lý khi button được nhấn
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Đây là nội dung của TabBar
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const TabBar(
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(
                                icon: Icon(
                              Icons.video_library,
                              color: Colors.black,
                            )),
                            Tab(
                                icon: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            )),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            // Nội dung cho tab "My Video"
                            MyVideoScreen(),

                            // Nội dung cho tab "Favorite Video"
                            VideoFavoriteScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Tạo MyVideoScreen và VideoFavoriteScreen như hai màn hình con
class MyVideoScreen extends StatelessWidget {
  const MyVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Đặt nội dung cho màn hình My Video ở đây
    return const Center(
      child: Text('My Video Content'),
    );
  }
}

class VideoFavoriteScreen extends StatelessWidget {
  const VideoFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Đặt nội dung cho màn hình Favorite Video ở đây
    return const Center(
      child: Text('Favorite Video Content'),
    );
  }
}
