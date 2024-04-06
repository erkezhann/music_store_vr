import 'package:music_store/src/view/screen/home_screen.dart';
import 'package:music_store/src/view/screen/intro_screen.dart';
import 'package:music_store/src/view/screen/login_screen.dart';
import 'package:music_store/src/view/screen/profile_screen.dart';
import 'package:music_store/src/view/screen/signup_screen.dart';

final routes = {
  '/': (context) => const IntroScreen(),
  '/home': (context) => const HomeScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
};
