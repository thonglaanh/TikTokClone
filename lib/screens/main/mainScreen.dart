import 'package:flutter/material.dart';
import 'package:tiktok/screens/main/home/homeScreen.dart';
import 'package:tiktok/screens/main/message/chatScreen.dart';
import 'package:tiktok/screens/main/profile/profileScreen.dart';
import 'package:tiktok/screens/main/upload_video/uploadVideoScreen.dart';
import 'package:tiktok/widgets/uploadCustomIcon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  List screenList = [
    const HomeScreen(),
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
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 25,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(icon: UploadCustomItem(), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox_sharp,
                size: 25,
              ),
              label: "Following"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: "Me",
          ),
        ],
      ),
      body: screenList[screenIndex],
    );
  }
}
