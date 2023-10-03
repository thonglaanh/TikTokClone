import 'package:flutter/material.dart';
import 'package:tiktok/screens/home/following/followingScreen.dart';
import 'package:tiktok/screens/home/foryou/forYouScreen.dart';
import 'package:tiktok/screens/home/message/chatScreen.dart';
import 'package:tiktok/screens/home/profile/profileScreen.dart';
import 'package:tiktok/screens/home/upload_video/uploadVideoScreen.dart';
import 'package:tiktok/widgets/uploadCustomIcon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List screenList = [
    const ForYouScreen(),
    const ChatScreen(),
    const UploadVideoScreen(),
    const FollowingScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              screenIndex = index;
            },
          );
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(icon: UploadCustomItem(), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox_sharp,
                size: 30,
              ),
              label: "Following"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "Me"),
        ],
      ),
      body: screenList[screenIndex],
    );
  }
}
