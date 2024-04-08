import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_store/core/app_extension.dart';
import 'package:music_store/src/model/instrument.dart';

class MusicInstrumentController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt currentPageViewItemIndicator = 0.obs;
  RxList<Instrument> cartInstrument = <Instrument>[].obs;
  RxList<Instrument> favoriteInstrumentList = <Instrument>[].obs;
  RxDouble totalPrice = 0.0.obs;

  switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  switchBetweenPageViewItems(int currentIndex) {
    currentPageViewItemIndicator.value = currentIndex;
  }

  isFavoriteFurniture(Instrument instrument) {
    instrument.isFavorite = !instrument.isFavorite;
    update();
    if (instrument.isFavorite) {
      favoriteInstrumentList.add(instrument);
    }
    if (!instrument.isFavorite) {
      favoriteInstrumentList.removeWhere((element) => element == instrument);
    }
  }

  void increaseItem(Instrument instrument) {
    instrument.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(Instrument instrument) {
    instrument.quantity = instrument.quantity-- < 1 ? 0 : instrument.quantity--;
    calculateTotalPrice();
    update();
    if (instrument.quantity < 1) {
      cartInstrument.removeWhere((element) => element == instrument);
    }
  }

  addToCart(Instrument instrument) {
    if (instrument.quantity > 0) {
      cartInstrument.add(instrument);
      cartInstrument.assignAll(cartInstrument.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartInstrument) {
      totalPrice.value += element.quantity * element.price;
    }
  }

  Future<void> sendOrderToFirestore() async {
    final CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');

    // Формирование списка покупок из корзины
    List<Map<String, dynamic>> orderItems = cartInstrument.map((instrument) {
      return {
        'title': instrument.title,
        'quantity': instrument.quantity,
        'color':
            instrument.color.value.toString(), // Преобразование цвета в строку
      };
    }).toList();
    await orders.add({
      'items': orderItems,
      'date': Timestamp.now(),
    });
  }

  void clearCart() {
    cartInstrument.clear();
    totalPrice.value = 0;
    update();
  }
}
