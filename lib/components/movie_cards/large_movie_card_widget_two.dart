import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/spaces.dart';
import '../../data/models/movie_model.dart';
import '../../data/url.dart';
import '../buttons/button_widget.dart';

class NewAndHotMovieCardTwo extends StatelessWidget {
  const NewAndHotMovieCardTwo({super.key, required this.future});
  final Future<List<Movie>> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.transparent,
            ),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Text('Somthing went wrong');
        }
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return SizedBox(
              height: 400,
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${Url.imageBaseUrl}${movie.coverImage}'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover)),
                  ),
                  vSpace10,
                  Row(
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
                              overflow: TextOverflow.ellipsis),
                        ),
                      )),
                      const CustomButton(
                          label: 'Share', icon: Icons.share_outlined),
                      space10,
                      const CustomButton(label: 'My List', icon: Icons.add),
                      space10,
                      const CustomButton(label: 'Play', icon: Icons.play_arrow),
                      space10
                    ],
                  ),
                  vSpace10,
                  Text(
                    movie.overview,
                    maxLines: 4,
                    style: const TextStyle(
                        fontSize: 14.5,
                        color: greyCl,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  TextStyle bullenitTextStyle() {
    return TextStyle(
        fontSize: 13,
        height: 1.3,
        fontWeight: FontWeight.w400,
        color: whiteCl.withOpacity(.9));
  }
}
