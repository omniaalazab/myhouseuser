import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/ui/views/all_provider.dart';

import 'package:housemanuser/ui/views/main_page.dart';
import 'package:housemanuser/ui/views/notification.dart';
import 'package:housemanuser/ui/views/profile.dart';

import 'package:housemanuser/ui/views/ticket.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int selectedIndex = 0;
  List<String> imagePath = [
    "assets/images/Home.png",
    "assets/images/Ticket.png",
    "assets/images/Category.png",
    "assets/images/Notification.png",
    "assets/images/Profile1.png",
  ];
  String? user = FirebaseAuth.instance.currentUser!.email;
  List<Map<String, dynamic>> screens = [
    {
      'screen': const MainView(),
    },
    {
      'screen': const Ticket(),
    },
    {
      'screen': const AllProvider(),
    },
    {
      'screen': const NotificationPage(),
    },
    {
      'screen': const ProfileScreen(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        //  backgroundColor: ColorHelper.darkpurple,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemCount: imagePath.length,
        tabBuilder: (index, isActive) {
          return Image(
              image: AssetImage(imagePath[index]),
              color: isActive ? ColorHelper.purple : ColorHelper.darkgrey);
        },
        activeIndex: selectedIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
      body: Center(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: screens[selectedIndex]['screen']),
      ),
    );
  }
}
