import 'package:flutter/material.dart';
import 'package:netflix_app/data/url.dart';

import '../../constants/spaces.dart';
import '../../data/models/series_model.dart';

class HomeSeriesCardSmall extends StatelessWidget {
  const HomeSeriesCardSmall(
      {super.key,
      required this.size,
      required this.heading,
      required this.future});

  final Size size;
  final String heading;
  final Future<List<Series>>? future;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: FutureBuilder<List<Series>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.transparent,),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return  Center(
                child: Text('Somthing Went Wrong${snapshot.error.toString()}'),
              );
            }
            final List<Series> movies = snapshot.data ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                vSpace15,
                SizedBox(
                  height: size.width * .4,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      width: size.width * .28,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${Url.imageBaseUrl}${movies[index].posterImage}'),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
