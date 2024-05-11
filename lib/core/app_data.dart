import 'package:flutter/material.dart';
import 'package:music_store/core/app_color.dart';
import 'package:music_store/src/model/bottom_navigation_item.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/model/instrument_color.dart';

class AppData {
  const AppData._();

  static List<Instrument> instrumentList = [
    Instrument(
      quantity: 1,
      isFavorite: false,
      title: 'Гитара',
      description:
          'Умная электрогитара нового поколения, встроенный динамик 10 Вт, уникальный корпус из углеродного волокна размером 39", форма Лес Пол, передовой чип и интеллектуальная звуковая система Enya S1 DSP, Bluetooth подключение для воспроизведения и управления через приложение, поддерживает до 10 часов автономной работы и требует всего 2 часа быстрой зарядки, идеально подходит для путешествий и выступлений на сцене! В комплекте: чехол, ключ, кабель для зарядки, 6.35 кабель.',
      price: 201300,
      model: 'assets/images/guitar.png',
      modelBlender: 'assets/models/gitar.glb',
      colors: <InstrumentColor>[
        InstrumentColor(color: const Color(0xFF616161), isSelected: true),
        InstrumentColor(color: const Color(0xFF424242)),
      ],
      color: AppColor.randomFirst,
    ),
    Instrument(
      isFavorite: false,
      quantity: 1,
      title: 'Барабаны',
      description:
          'Ударная установка для начинающих, корпуса барабанов изготовлены из 9-слоев липы, штампованные ободы Mapex, упругие вибропоглощающие опоры ножек напольных томов, низкопрофильные утопленные шипы ножек большого барабана с амортизирующими опорами, 8 настроечных винтов малого барабана, яркое резонантное звучание с естественным сустейном, в комплекте: 5 барабанов, 4 стойки, 3 тарелки, педаль для бас-барабана, стульчик, палочки 7A.',
      price: 201300,
      model: 'assets/images/baraban.png',
      modelBlender: '',
      colors: <InstrumentColor>[
        InstrumentColor(color: const Color(0xFF5d4037), isSelected: true),
        InstrumentColor(color: const Color(0xFF424242)),
      ],
      color: AppColor.randomSecond,
    ),
    Instrument(
      quantity: 1,
      isFavorite: false,
      title: 'Скрипки',
      description:
          'Скрипичный комплект, размер 1/4, покрытие скрипки прозрачным коричневым лаком, фурнитура из твердых пород древесины, струнодержатель с машинками, подбородник из черного дерева, смычок из бразильского дерева с эбеновой колодкой, в комплекте: легкий футляр, смычок, канифоль, подбородник .',
      price: 201300,
      model: 'assets/images/violin.png',
      modelBlender: 'assets/models/violin.glb',
      colors: <InstrumentColor>[
        InstrumentColor(color: const Color(0xFF616161), isSelected: true),
        InstrumentColor(color: const Color(0xFF212121)),
      ],
      color: AppColor.randomThird,
    ),
    Instrument(
      quantity: 1,
      isFavorite: false,
      title: 'Саксофоны',
      description:
          'Альт-саксофон, корпус и эска из лакированной латуни, клапанный механизм из латуни, позолоченное покрытие, регулируемая подпорка для большого пальца, подушки с резонатором, в комплекте: мундштук, средство по уходу, лигатура и фирменный легкий кейс.',
      price: 201300,
      model: 'assets/images/saxophones.png',
      modelBlender: '',
      colors: <InstrumentColor>[
        InstrumentColor(color: const Color(0xFF455a64), isSelected: true),
        InstrumentColor(color: const Color(0xFF263238)),
      ],
      color: AppColor.randomFour,
    ),
    Instrument(
      quantity: 1,
      isFavorite: false,
      title: 'Рояль',
      description:
          'Акустический кабинетный рояль, элегантный дизайн, механика Rittmuller High Action, молоточки Rittmuller Grand Hammers из прочной древесины, мост из белого бука и клёна, головки покрыты войлоком, вирбельбанк инструмента из 17-слойной доски клена, чугунная рама инструмента выносит любое давление струн, колки из немецкой никелированной стали, 3 педали, черный цвет.',
      price: 201300,
      model: 'assets/images/piano.png',
      modelBlender: '',
      colors: <InstrumentColor>[
        InstrumentColor(color: const Color(0xFF5d4037), isSelected: true),
        InstrumentColor(color: const Color(0xFF455a64)),
      ],
      color: AppColor.randomEight,
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Главная'),
    const BottomNavigationItem(
        Icon(Icons.add_shopping_cart_rounded), 'Корзина'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Любимые'),
    const BottomNavigationItem(Icon(Icons.person), 'Профиль')
  ];
}
