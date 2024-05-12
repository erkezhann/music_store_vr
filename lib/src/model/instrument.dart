import 'package:flutter/material.dart';
import 'package:music_store/src/model/instrument_color.dart';

class Instrument {
  String title;
  String description;
  double price;
  int quantity;
  String image;
  String selectedModel;
  String firstModel;
  String secondModel;
  bool isFavorite;
  List<InstrumentColor> colors;
  Color color;

  Instrument({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.image,
    required this.selectedModel,
    required this.firstModel,
    required this.secondModel,
    this.isFavorite = false,
    required this.colors,
    required this.color,
  });
}
