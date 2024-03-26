import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_theme.dart';
import 'package:music_store/firebase_options.dart';
import 'package:music_store/src/view/screen/intro_screen.dart';
import 'dart:ui' show PointerDeviceKind;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: const IntroScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
