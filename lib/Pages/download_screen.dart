import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:netflix_app/constants/colors.dart';
import 'package:netflix_app/constants/spaces.dart';
import 'package:netflix_app/data/api.dart';
import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/url.dart';

import '../components/appbar/appbar_widget.dart';
import '../components/movie_cards/download_movie_card.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appbarWidget(title: 'Downloads', context: context),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: [
            const Row(
              children: [
                Icon(
                  EvaIcons.settings_2_outline,
                  color: greyCl,
                  size: 20,
                ),
                hSpace5,
                Text(
                  'Smart Downloads',
                  style: TextStyle(fontSize: 14, color: greyCl),
                )
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Turn on Downloads for You',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpace20,
            const Text(
              "We'll download movies and shows just for you, so you'll \nalways have somthing to watch",
              style: TextStyle(fontSize: 14, color: greyCl, wordSpacing: 1),
            ),
            vSpace10,

            // Download Recomendation image
            FutureBuilder<List<Movie>>(
                future: Api().getTrendingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.transparent,
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text('Somthing went wrong'),
                    );
                  }
                  final movies = snapshot.data ?? [];
                  return Container(
                    height: deviceSize.width * .7,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    // color: Colors.blue,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: deviceSize.width * .32,
                            backgroundColor: greyCl.withOpacity(0.3),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: DownloadCard(
                                angle: pi / 16,
                                imagepath:
                                    '${Url.imageBaseUrl}${movies[0].posterpath}',
                                height: deviceSize.width * .45,
                                width: deviceSize.width * .33,
                                margin: const EdgeInsets.only(left: 150))),
                        Align(
                            alignment: Alignment.center,
                            child: DownloadCard(
                                angle: pi / -16,
                                imagepath:
                                    '${Url.imageBaseUrl}${movies[1].posterpath}',
                                height: deviceSize.width * .45,
                                width: deviceSize.width * .33,
                                margin: const EdgeInsets.only(right: 150))),
                        Align(
                          alignment: Alignment.center,
                          child: DownloadCard(
                            angle: 0,
                            height: deviceSize.width * .50,
                            imagepath:
                                '${Url.imageBaseUrl}${movies[2].posterpath}',
                            width: deviceSize.width * .35,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromHeight(43)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade700)),
              child: const Text('Set Up'),
            ),
            const SizedBox(height: 50),

            Container(
              height: 36,
              margin: EdgeInsets.symmetric(horizontal: deviceSize.width * .23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: greyCl.withOpacity(.2),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Find More to Download',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: whiteCl),
              ),
            )
          ],
        ),
      ),
    );
  }
}

