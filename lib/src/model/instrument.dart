import 'package:music_store/src/model/instrument_color.dart';

class Instrument {
  String title;
  String description;
  double price;
  int quantity;
  String model;
  bool isFavorite;
  List<InstrumentColor> colors;

  Instrument({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.model,
    this.isFavorite = false,
    required this.colors,
  });
}
