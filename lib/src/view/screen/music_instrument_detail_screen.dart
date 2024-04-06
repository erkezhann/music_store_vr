import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/view/screen/home_screen.dart';
import 'package:music_store/src/view/widget/color_picker.dart';
import 'package:music_store/src/view/widget/counter_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicInstrumentDetailScreen extends StatelessWidget {
  final Instrument instrument;

  const MusicInstrumentDetailScreen({
    super.key,
    required this.instrument,
  });

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      actions: [
        GetBuilder(
          builder: (MusicInstrumentController controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteFurniture(instrument),
              icon: instrument.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(instrument.title, style: h2Style),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Цена',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(
                child: Text("${instrument.price}₸", style: h2Style),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(instrument),
            child: const Text(
              "Добавить",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget instrumentImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      height: height * 0.35,
      child: const Stack(
        alignment: Alignment.bottomCenter,
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        controller.currentPageViewItemIndicator.value = 0;
        Future.value(true);
        return;
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(),
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                instrumentImageSlider(height),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    instrument.title,
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  instrument.description,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Цвет: ",
                      style: h2Style,
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
