import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/app_data.dart';
import 'package:music_store/core/app_style.dart';
import 'package:music_store/src/model/instrument.dart';
import 'package:music_store/src/view/screen/music_instrument_detail_screen.dart';
import 'package:music_store/src/view/widget/music_instrument_list_view.dart';

class MusicInstrumentListScreen extends StatelessWidget {
  const MusicInstrumentListScreen({super.key});

  PreferredSize _appBar() {
    final user = FirebaseAuth.instance.currentUser;
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user != null ? '${user.displayName}' : 'Вы не вошли',
                      style: h2Style),
                  const Text("Купить любимые инструменты", style: h3Style),
                ],
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
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            InstrumentListView(
              instrumentList: AppData.instrumentList,
              onTap: navigate,
            ),
            const Text("Популярные", style: h2Style),
            InstrumentListView(
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
