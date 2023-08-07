import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/url.dart';

import '../../constants/spaces.dart';

class TopTenMovieCard extends StatelessWidget {
  const TopTenMovieCard(
      {super.key,
      required this.size,
      required this.future,
      required this.label});

  final Size size;
  final String label;
  final Future<List<Movie>>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.transparent,),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final movies = snapshot.data ?? [];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace10,
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                vSpace15,
                SizedBox(
                  height: size.width * .46,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      width: size.width * .42,
                      // color: Colors.amber,
                      margin: const EdgeInsets.only(right: 10),
                      child: Stack(children: [
                        Positioned(
                            bottom: size.width * .01,
                            left: size.width * .02,
                            child: BorderedText(
                              strokeColor: Colors.white,
                              strokeWidth: 1.5,
                              child: Text(
                                '${index + 1}',
                                style: index + 1 == 10
                                    ? GoogleFonts.alumniSansInlineOne(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            shadows: [
                                              Shadow(
                                                color: Colors.grey.shade700
                                                    .withOpacity(.9),
                                                offset:
                                                    const Offset(-3.0, -1.0),
                                                blurRadius: 30.0,
                                              ),
                                            ],
                                            fontSize: 110,
                                            fontWeight: FontWeight.bold))
                                    : TextStyle(
                                        color: Colors.grey.shade900,
                                        shadows: [
                                          Shadow(
                                            color: Colors.grey.shade700
                                                .withOpacity(.9),
                                            offset: const Offset(-3.0, -1.0),
                                            blurRadius: 30.0,
                                          ),
                                        ],
                                        fontSize: 110,
                                        fontWeight: FontWeight.bold),
                              ),
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: size.width * .30,
                            height: size.width * .40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${Url.imageBaseUrl}${movies[index].posterpath}'),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high)),
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
