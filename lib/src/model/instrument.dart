import 'package:flutter/material.dart';
import 'package:music_store/src/model/instrument_color.dart';

class Instrument {
  String title;
  String description;
  double price;
  int quantity;
  String model;
  String modelBlender;
  bool isFavorite;
  List<InstrumentColor> colors;
  Color color;

  Instrument({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.model,
    required this.modelBlender,
    this.isFavorite = false,
    required this.colors,
    required this.color,
  });
}
