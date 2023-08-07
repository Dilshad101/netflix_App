import 'package:flutter/material.dart';
import 'package:netflix_app/data/api.dart';
import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/url.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../constants/colors.dart';
import '../../constants/spaces.dart';

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api().getNewReleasedMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final data = snapshot.data ?? [];

          return FutureBuilder(
              future: getPaletColor(data[data.length - 1]),
              builder: (context, paletteGenerator) {
                if (paletteGenerator.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      color: Colors.transparent);
                } else if (paletteGenerator.hasError ||
                    !paletteGenerator.hasData) {
                  return const Center(
                    child: Text('Somthing went wrong'),
                  );
                }
                final palette = paletteGenerator.data;
                final paletteColor = palette?.colors.first;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: size.height * .78,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [paletteColor ?? Colors.grey, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 2.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 145,
                        width: double.maxFinite,
                      ),
                      vSpace10,
                      Expanded(
                          child:
                              //  FutureBuilder(
                              //     future: Api().getNewReleasedMovies(),
                              //     builder: (context, snapshot) {
                              //       if (snapshot.connectionState == ConnectionState.waiting) {
                              //         return const CircularProgressIndicator(color: Colors.transparent);
                              //       } else if (snapshot.hasError || !snapshot.hasData) {
                              //         return const Center(
                              //           child: Text('Somthing went wrong'),
                              //         );
                              //       }
                              //       final data = snapshot.data??[];
                              Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${Url.imageBaseUrl}${data[data.length - 1].posterpath}'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, 2),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [
                                    Colors.black.withOpacity(.6),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        0),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        whiteCl)),
                                            onPressed: () {},
                                            child: const Text(
                                              'Play',
                                              style: TextStyle(
                                                  color: blackCl,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))),
                                    space10,
                                    Expanded(
                                        child: ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                whiteCl.withOpacity(.6),
                                              ),
                                            ),
                                            icon: const Icon(Icons.add),
                                            label: const Text(
                                              'My List',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      vSpace20
                    ],
                  ),
                );
              });
        });
  }

  Future<PaletteGenerator> getPaletColor(Movie movie) async {
    return await PaletteGenerator.fromImageProvider(
        NetworkImage('${Url.imageBaseUrl}${movie.posterpath}'));
  }
}
