import 'package:app_architecture/constants/colors.dart';
import 'package:app_architecture/constants/consts.dart';
import 'package:app_architecture/constants/images.dart';
import 'package:app_architecture/view/controllers/home_controller.dart';
import 'package:app_architecture/view/pages/account_screen/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_architecture/constants/strings.dart';
import 'package:get/get.dart';

import '../pages/backpack_screen/backpack_screen.dart';
import '../pages/home_screen/home_screen.dart';
import '../pages/past_screen/past_screen.dart';
import '../pages/quest_screen/quest_screen.dart';

final List<BottomNavigationBarItem> navbarItem = [
  BottomNavigationBarItem(
    icon: Image.asset(homeIcon, width: 26),
    label: home,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(backpackIcon, width: 26),
    label: backpack,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(pastIcon, width: 26),
    label: past,
  ),
];

final List<Widget> navBody = [
  HomeScreen(),
  BackpackScreen(),
  QuestScreen(
    imagePath: "assets/images/quest_image.jpg",
    title: "Quest Başlığı",
    description: "Quest Açıklaması",
    imageList: [],
    currentIndex: 0,
  ),
  const PastScreen(),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() => navBody.elementAt(controller.currentNavIndex.value)),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.purple,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
