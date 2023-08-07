import 'package:flutter/material.dart';
import 'package:netflix_app/components/buttons/button_widget.dart';
import 'package:netflix_app/constants/colors.dart';
import 'package:netflix_app/constants/spaces.dart';
import 'package:netflix_app/data/models/series_model.dart';
import 'package:netflix_app/data/url.dart';

class NewAndHotSeriesCard extends StatelessWidget {
  const NewAndHotSeriesCard({
    super.key,
    required this.future,
  });
  final Future<List<Series>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Series>>(
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
              itemCount: 10,
              itemBuilder: (context, index) {
                final movie = movies[index];
              
                return SizedBox(
                  height: 420,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
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
                                          '${Url.imageBaseUrl}${movie.coverImage??movie.posterImage}'),
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    )),
                              ),
                              vSpace10,
                              SizedBox(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 60,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        movie.name,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )),
                                    const CustomButton(
                                        label: 'Share',
                                        icon: Icons.share_outlined),
                                    space10,
                                    const CustomButton(
                                        label: 'My List', icon: Icons.add),
                                    space10,
                                    const CustomButton(
                                        label: 'Play', icon: Icons.play_arrow),
                                    space10
                                  ],
                                ),
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
