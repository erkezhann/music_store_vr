import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_data.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/config/theme_provider.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/ui/screen/details/music_instrument_detail_screen.dart';
import 'package:music_store/src/ui/widget/music_instrument_list_view.dart';
import 'package:music_store/src/ui/widget/music_instrument_popular_list_view.dart';
import 'package:provider/provider.dart';

class MusicInstrumentListScreen extends StatelessWidget {
  const MusicInstrumentListScreen({super.key});

  PreferredSize _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final user = FirebaseAuth.instance.currentUser;
    return PreferredSize(
      preferredSize: const Size.fromHeight(110),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user != null ? '${user.displayName}' : 'Вы не авторизованы',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    "Купить инструменты",
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                icon: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    // Check if dark mode is enabled and set the icon accordingly
                    return Icon(
                      themeProvider.isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      size: 50,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Поиск',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future<Widget?> navigate(Instrument instrument) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              MusicInstrumentDetailScreen(instrument: instrument),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            InstrumentListView(
              instrumentList: AppData.instrumentList,
              onTap: navigate,
            ),
            Text("Популярные", style: theme.textTheme.bodyLarge),
            PopularInstrumentListView(
              instrumentList: AppData.instrumentList,
              isHorizontal: false,
              onTap: navigate,
            ),
          ],
        ),
      ),
    );
  }
}
