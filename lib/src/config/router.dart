import 'package:music_store/src/ui/screen/home/home_screen.dart';
import 'package:music_store/src/ui/screen/intro/intro_screen.dart';
import 'package:music_store/src/ui/screen/auth/login_screen.dart';
import 'package:music_store/src/ui/screen/profile/profile_screen.dart';
import 'package:music_store/src/ui/screen/auth/signup_screen.dart';

final routes = {
  '/': (context) => const IntroScreen(),
  '/home': (context) => const HomeScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
};
