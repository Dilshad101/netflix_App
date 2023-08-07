import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:netflix_app/Pages/search_screen.dart';
import 'package:netflix_app/components/buttons/outlined_button_widget.dart';
import 'package:netflix_app/constants/colors.dart';
import 'package:netflix_app/constants/spaces.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.colorNotifier,
    required this.safeAreaHeight,
    required this.tabBarNotifier,
  });

  final ValueNotifier<bool> colorNotifier;
  final double safeAreaHeight;
  final ValueNotifier<bool> tabBarNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: colorNotifier,
        builder: (context, isTransparent, _) {
          return SizedBox(
            height: 148,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(microseconds: 500),
                  color: isTransparent
                      ? Colors.black.withOpacity(.5)
                      : Colors.transparent,
                  height: 65 + safeAreaHeight,
                  child: Column(
                    children: [
                      Container(
                        height: safeAreaHeight,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 70,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://clipground.com/images/logo-de-netflix-clipart-1.png'),
                                    fit: BoxFit.contain)),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              EvaIcons.search,
                              color: whiteCl,
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenSearch()));
                            },
                          ),
                          hSpace20,
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.greenAccent,
                            ),
                          ),
                          hSpace20
                        ],
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: tabBarNotifier,
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      curve: Curves.easeInCubic,
                      duration: const Duration(milliseconds: 300),
                      height: value ? 50 : 0,
                      width: double.maxFinite,
                      color: isTransparent
                          ? Colors.black.withOpacity(.5)
                          : Colors.transparent,
                      child: const Row(
                        children: [
                          hSpace20,
                          CustomOutLinedButton(label: 'TV Shows'),
                          space10,
                          CustomOutLinedButton(label: 'Movies'),
                          space10,
                          CustomOutLinedButton(label: 'Catagories'),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}
