import 'package:flutter/material.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/view/screen/home_screen.dart';
import 'package:music_store/src/view/widget/empty_widget.dart';
import 'package:music_store/src/view/widget/music_instrument_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoriteFurnitureList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: controller.favoriteFurnitureList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Пустой",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
