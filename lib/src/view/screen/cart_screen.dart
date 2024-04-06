import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/view/screen/home_screen.dart';
import 'package:music_store/src/view/widget/bottom_bar.dart';
import 'package:music_store/src/view/widget/cart_list_view.dart';
import 'package:music_store/src/view/widget/counter_button.dart';
import 'package:music_store/src/view/widget/empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Корзина", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(Icons.delete, color: AppColor.lightBlack),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Общая цена",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Купить",
            onTap: controller.totalPrice > 0
                ? () {
                    Navigator.pushNamed(context, '');
                  }
                : null,
          );
        },
      ),
      body: GetBuilder(
        builder: (MusicInstrumentController controller) {
          return controller.cartInstrument.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CartListView(
                    instrumentItems: controller.cartInstrument,
                    counterButton: (instrument) {
                      return CounterButton(
                        orientation: Axis.vertical,
                        onIncrementSelected: () =>
                            controller.increaseItem(instrument),
                        onDecrementSelected: () =>
                            controller.decreaseItem(instrument),
                        label: instrument.quantity,
                      );
                    },
                  ),
                )
              : const EmptyWidget(title: "Пусто");
        },
      ),
    );
  }
}
