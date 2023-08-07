import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/components/buttons/button_widget.dart';
import 'package:netflix_app/constants/colors.dart';
import 'package:netflix_app/constants/spaces.dart';
import 'package:netflix_app/data/models/movie_model.dart';
import 'package:netflix_app/data/url.dart';

class NewAndHotMovieCard extends StatelessWidget {
  const NewAndHotMovieCard({
    super.key,
    required this.upcoming,
    required this.future,
    required this.topTen,
  });
  final bool upcoming;
  final bool topTen;
  final Future<List<Movie>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (!snapshot.hasData || snapshot.hasError) {
            return const Center(child: Text('Somthing went wrong'));
          }
          final movies = snapshot.data ?? [];

          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: topTen ? 10 : movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final date = DateTime.parse(movie.releaseDate);
                final month = DateFormat('MMM').format(date);
                final fullMonth = DateFormat('MMMM').format(date);
                final day = date.day;

                return SizedBox(
                  height: 420,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      topTen == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  month,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: whiteCl.withOpacity(.8)),
                                ),
                                Text(
                                  day.toString(),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${Url.imageBaseUrl}${movie.coverImage}'),
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    )),
                              ),
                              vSpace10,
                              SizedBox(
                                child: upcoming
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: double.maxFinite,
                                              height: 65,
                                              child: Text(
                                                movie.title,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ),
                                          hSpace20,
                                          const CustomButton(
                                            label: 'Remind Me',
                                            icon:
                                                Icons.notifications_none_sharp,
                                          ),
                                          hSpace20,
                                          const CustomButton(
                                              label: 'Info',
                                              icon: Icons.info_outline),
                                          hSpace20,
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            height: 60,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              movie.title,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          )),
                                          const CustomButton(
                                              label: 'Share',
                                              icon: Icons.share_outlined),
                                          space10,
                                          const CustomButton(
                                              label: 'My List',
                                              icon: Icons.add),
                                          space10,
                                          const CustomButton(
                                              label: 'Play',
                                              icon: Icons.play_arrow),
                                          space10
                                        ],
                                      ),
                              ),
                              vSpace10,
                              Text(
                                'Coming $fullMonth $day',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: whiteCl.withOpacity(.8)),
                              ),
                              vSpace10,
                              Text(
                                movie.overview,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.3,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: greyCl),
                              ),
                              vSpace20,
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
