import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_store/src/components/card_type.dart';
import 'package:music_store/src/components/card_utils.dart';
import 'package:music_store/src/components/input_formatters.dart';
import 'package:music_store/src/controller/music_instrumental_controller.dart';
import 'package:music_store/src/ui/screen/home/home_screen.dart';
import 'package:music_store/src/ui/widget/bottom_bar.dart';
import 'package:music_store/src/ui/widget/cart_list_view.dart';
import 'package:music_store/src/ui/widget/counter_button.dart';
import 'package:music_store/src/ui/widget/empty_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        ),
      ],
    );
  }

  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.invalid;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

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
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Добавьте карту!",
                              style: theme.textTheme.bodyMedium,
                            ),
                            content: SizedBox(
                              width: size.width,
                              height: size.height * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Column(
                                  children: [
                                    Form(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            style: theme.textTheme.bodyMedium,
                                            controller: cardNumberController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  19),
                                              CardNumberInputFormatter(),
                                            ],
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  theme.textTheme.bodyMedium,
                                              hintText: "Номер карты",
                                              suffixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CardUtils.getCardIcon(
                                                  cardType,
                                                ),
                                              ),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SvgPicture.asset(
                                                    "assets/images/icons/card.svg"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            child: TextFormField(
                                              style: theme.textTheme.bodyMedium,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    theme.textTheme.bodyMedium,
                                                hintText: "ФИО",
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: SvgPicture.asset(
                                                      "assets/images/icons/user.svg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                      4,
                                                    ),
                                                  ],
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                  decoration: InputDecoration(
                                                    labelStyle: theme
                                                        .textTheme.bodyMedium,
                                                    hintText: "CVV",
                                                    prefixIcon: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: SvgPicture.asset(
                                                          "assets/images/icons/cvv.svg"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                        5),
                                                    CardMonthInputFormatter(),
                                                  ],
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                  decoration: InputDecoration(
                                                    labelStyle: theme
                                                        .textTheme.bodyMedium,
                                                    hintText: "MM/YY",
                                                    prefixIcon: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 10,
                                                      ),
                                                      child: SvgPicture.asset(
                                                          "assets/images/icons/calendar.svg"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                        style: theme.elevatedButtonTheme.style,
                                        child: Text(
                                          "Купить",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        onPressed: () async {
                                          await controller
                                              .sendOrderToFirestore();
                                          if (context.mounted) {
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text("Успешно!"),
                                                  content: const Text(
                                                    "Вы успешно купили товар, мы позвоним вам в ближащее время!",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Закрыть"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Закрыть"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    controller.clearCart();
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
