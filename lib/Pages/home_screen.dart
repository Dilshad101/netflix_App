import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/components/movie_cards/top_ten_movie_card.dart';
import 'package:netflix_app/constants/spaces.dart';
import 'package:netflix_app/data/api.dart';

import '../components/appbar/home_appbar_widget.dart';
import '../components/movie_cards/home_series_card_small.dart.dart';
import '../components/movie_cards/home_movie_card_small.dart';
import '../components/movie_cards/main_movie_card_widget.dart';

class ScreenHome extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final ValueNotifier<bool> tabBarNotifier = ValueNotifier(true);

  final ValueNotifier<bool> colorNotifier = ValueNotifier(false);

  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_scrollListner);
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.maxFinite,
        child: Stack(
          children: [
            // Body
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              children: [
                // main movie card
                MainMovieCard(size: size),
                vSpace20,
                HomeMovieCardSmall(
                  size: size,
                  heading: 'Trending Now',
                  future: Api().getTrendingMovies(),
                ),
                vSpace20,
                HomeMovieCardSmall(
                  size: size,
                  heading: 'New Releases',
                  future: Api().getNewReleasedMovies(),
                ),
                vSpace20,
                TopTenMovieCard(
                  label: 'Top 10 Movies',
                  size: size,
                  future: Api().getTopRatedMovies(),
                ),
                vSpace20,
                HomeMovieCardSmall(
                  size: size,
                  heading: 'Up Coming Movies',
                  future: Api().getUpcomingMovies(),
                ),
                 vSpace20,
                HomeSeriesCardSmall(
                  size: size,
                  heading: ' Bingeworthy TV Dramas',
                  future: Api().getSeries(),
                ),
                vSpace20,
                 HomeSeriesCardSmall(
                  size: size,
                  heading: 'Airing Today',
                  future: Api().getAiringTodaySeries(),
                ),
                vSpace20
              ],
            ),

            //  Netflix  AppBar
            HomeAppBar(
                colorNotifier: colorNotifier,
                safeAreaHeight: safeAreaHeight,
                tabBarNotifier: tabBarNotifier),
          ],
        ),
      ),
    );
  }

  _scrollListner() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      tabBarNotifier.value = true;
    } else {
      tabBarNotifier.value = false;
    }
    if (_scrollController.offset > 400) {
      colorNotifier.value = true;
    } else {
      colorNotifier.value = false;
    }
  }
}
