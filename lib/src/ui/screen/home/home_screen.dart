import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_data.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/ui/screen/cart/cart_screen.dart';
import 'package:music_store/src/ui/screen/favorite/favorite_screen.dart';
import 'package:music_store/src/ui/screen/home/music_instrument_list_screen.dart';
import 'package:music_store/src/ui/screen/profile/profile_screen.dart';

final MusicInstrumentController controller =
    Get.put(MusicInstrumentController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    MusicInstrumentListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            showUnselectedLabels: true,
            onTap: controller.switchBetweenBottomNavigationItems,
            fixedColor: theme.iconTheme.color,
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
