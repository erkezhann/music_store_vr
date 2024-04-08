import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/ui/screen/home/home_screen.dart';
import 'package:music_store/src/ui/widget/bottom_bar.dart';
import 'package:music_store/src/ui/widget/cart_list_view.dart';
import 'package:music_store/src/ui/widget/counter_button.dart';
import 'package:music_store/src/ui/widget/empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        "Корзина",
        style: theme.textTheme.bodyLarge,
      ),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: Icon(
            Icons.delete,
            color: theme.iconTheme.color,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Общая цена",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Купить",
            onTap: controller.totalPrice > 0
                ? () {
                    Navigator.pushNamed(context, '/');
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
