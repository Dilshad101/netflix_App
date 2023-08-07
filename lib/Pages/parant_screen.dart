import 'package:flutter/material.dart';
import 'package:netflix_app/Pages/download_screen.dart';
import 'package:netflix_app/Pages/home_screen.dart';
import 'package:netflix_app/Pages/new_and_hot_screen.dart';
import 'package:netflix_app/constants/colors.dart';

class ScreenParent extends StatelessWidget {
  ScreenParent({super.key});
  final List<Widget> pages = [
    ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> pageNotifier = ValueNotifier(0);
    return Scaffold(
      backgroundColor: blackCl,
      body: ValueListenableBuilder(
          valueListenable: pageNotifier,
          builder: (context, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pageNotifier,
          builder: (context, int index, _) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: greyCl.shade900.withOpacity(.5),
              selectedItemColor: whiteCl,
              unselectedItemColor: greyCl,
              currentIndex: index,
              selectedIconTheme: const IconThemeData(size: 30),
              unselectedIconTheme: const IconThemeData(size: 30),
              selectedLabelStyle: const TextStyle(fontSize: 10),
              unselectedLabelStyle: const TextStyle(fontSize: 10),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_library_outlined),
                    label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download_for_offline_rounded),
                    label: 'Downloads'),
              ],
              onTap: (value) {
                pageNotifier.value = value;
              },
            );
          }),
    );
  }
}
