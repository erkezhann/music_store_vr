import 'package:flutter/material.dart';
import 'package:music_store/core/app_style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget introButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(8),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.white.withOpacity(0.4),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            icon: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            label: Text(
              "Поехали",
              style: h3Style.copyWith(color: Colors.white, letterSpacing: 1.4),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Фоновое изображение
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/intro/intro-bg.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Полупрозрачный слой для затемнения фона
          Container(
            color: Colors.black.withOpacity(
                0.5), // Регулируйте этот параметр для достижения желаемой степени темноты
          ),
          // Ваш интерфейс, например SafeArea и остальные элементы
          SafeArea(
            bottom:
                false, // Ignore safe area at the top to extend behind the status bar
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    "Виртуальный музыкальный мир",
                    style: h1Style.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Погрузитесь в выбор инструментов с VR-технологиями",
                    style: h3Style.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  introButton(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
