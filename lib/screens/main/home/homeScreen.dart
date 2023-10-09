import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                        Tab(text: 'For you'),
                        Tab(
                          text: 'Folowing',
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        ScreenForYou(),
                        FollowingScreen(),
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
  }
}

class ScreenForYou extends StatelessWidget {
  const ScreenForYou({super.key});

  @override
  Widget build(BuildContext context) {
    // Đặt nội dung cho màn hình My Video ở đây
    return const Center(
      child: Text('For you'),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Đặt nội dung cho màn hình Favorite Video ở đây
    return const Center(
      child: Text('Following'),
    );
  }
}
