import 'package:flutter/material.dart';
import 'package:music_store/src/ui/screen/home/home_screen.dart';
import 'package:music_store/src/ui/widget/empty_widget.dart';
import 'package:music_store/src/ui/widget/music_instrument_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Любимые", style: theme.textTheme.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoriteInstrumentList.isNotEmpty
                  ? InstrumentListView(
                      isHorizontal: false,
                      instrumentList: controller.favoriteInstrumentList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Пусто",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
