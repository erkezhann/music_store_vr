import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';
import 'package:music_store/core/app_data.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/view/screen/cart_screen.dart';
import 'package:music_store/src/view/screen/favorite_screen.dart';
import 'package:music_store/src/view/screen/music_instrument_list_screen.dart';
import 'package:music_store/src/view/screen/profile_screen.dart';

final OfficeFurnitureController controller =
    Get.put(OfficeFurnitureController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    MusicStoreListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            showUnselectedLabels: true,
            onTap: controller.switchBetweenBottomNavigationItems,
            fixedColor: AppColor.lightBlack,
            items: AppData.bottomNavigationItems
                .map(
                  (element) => BottomNavigationBarItem(
                    icon: element.icon,
                    label: element.label,
                  ),
                )
                .toList(),
          );
        },
      ),
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}
