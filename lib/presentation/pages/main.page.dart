import 'dart:math';

import 'package:camera/camera.dart';
import 'package:camera_flutter/presentation/pages/home/home.page.dart';
import 'package:camera_flutter/presentation/pages/home/widgets/preview_camera.dart';
import 'package:camera_flutter/presentation/pages/message/message.page.dart';
import 'package:camera_flutter/presentation/pages/profile/profile.page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final CameraController controller;

  const MainPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController hPagerController =
      PageController(initialPage: 1, keepPage: true);
  PageController vPagerController = PageController(keepPage: true);

  void _navigateToTab(int index) {
    hPagerController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: hPagerController,
      children: [
        // Tab Profile
        ProfilePage(onBack: () => _navigateToTab(1)),
        // Tab Home
          HomePage(
            controller: widget.controller,
            onTapMessage: () => _navigateToTab(2),
            onTapProfile: () => _navigateToTab(0),
          ),
        // Tab Message
     MessagePage(onBack: () => _navigateToTab(1)),
      ],
    );
  }


}

