import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/ui/screen/home/home_screen.dart';
import 'package:music_store/src/ui/widget/color_picker.dart';
import 'package:music_store/src/ui/widget/counter_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicInstrumentDetailScreen extends StatelessWidget {
  final Instrument instrument;

  const MusicInstrumentDetailScreen({
    super.key,
    required this.instrument,
  });

  PreferredSizeWidget _appBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        GetBuilder(
          builder: (MusicInstrumentController controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteFurniture(instrument),
              icon: instrument.isFavorite
                  ? Icon(Icons.bookmark, color: theme.iconTheme.color)
                  : Icon(Icons.bookmark_border, color: theme.iconTheme.color),
            );
          },
        )
      ],
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.arrowLeft, color: theme.iconTheme.color),
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(instrument.title, style: theme.textTheme.bodyLarge),
    );
  }

  Widget bottomBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text('Цена', style: theme.textTheme.bodyMedium),
              ),
              const SizedBox(height: 5),
              FittedBox(
                child: Text("${instrument.price}₸",
                    style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightOrange,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(instrument),
            child: Text(
              "Добавить",
              style: theme.textTheme.bodyMedium,
            ),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget instrumentImageSlider(double height, double width) {
    return Container(
      height: height * 0.45,
      width: width,
      color: instrument.color,
      child: instrument.modelBlender.isEmpty
          ? Image.asset(
              instrument.model,
              fit: BoxFit.fitHeight,
            )
          : BabylonJSViewer(
              src: instrument.modelBlender,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        controller.currentPageViewItemIndicator.value = 0;
        Future.value(true);
        return;
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(context),
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                instrumentImageSlider(size.height, size.width),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    instrument.title,
                    style: theme.textTheme.displaySmall,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  instrument.description,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Цвет: ",
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.end,
                    ),
                    Expanded(child: ColorPicker(instrument.colors)),
                    Expanded(child: GetBuilder(
                      builder: (MusicInstrumentController controller) {
                        return CounterButton(
                          label: instrument.quantity,
                          onIncrementSelected: () =>
                              controller.increaseItem(instrument),
                          onDecrementSelected: () =>
                              controller.decreaseItem(instrument),
                        );
                      },
                    ))
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
