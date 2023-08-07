import 'package:flutter/material.dart';
import 'package:netflix_app/components/appbar/appbar_widget.dart';
import 'package:netflix_app/components/movie_cards/hot_and_new_movie_card.dart';
import 'package:netflix_app/components/movie_cards/hot_and_new_series_card.dart';
import 'package:netflix_app/components/movie_cards/large_movie_card_widget_two.dart';
import 'package:netflix_app/constants/colors.dart';
import 'package:netflix_app/data/api.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
          child: Scaffold(
        appBar: appbarWidget(
          title: 'New & Hot',
          context: context,
          notification: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              indicator: BoxDecoration(
                  color: whiteCl, borderRadius: BorderRadius.circular(30)),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 6),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              labelColor: blackCl,
              labelStyle: const TextStyle(
                  color: blackCl, fontSize: 15, fontWeight: FontWeight.bold),
              unselectedLabelColor: whiteCl.withOpacity(.7),
              isScrollable: true,
              tabs: [
                customTab(text: '🍿 Coming Soon '),
                customTab(text: '🔥 Everyone\'s watching '),
  
                customTab(text: '🔟 Top 10 Tv Shows'),
                customTab(text: '🔟 Top 10 Movies')
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewAndHotMovieCard(
              upcoming: true,
              topTen: false,
              future: Api().getUpcomingMovies(),
            ),
            NewAndHotMovieCardTwo(
              future: Api().getTrendingMovies(),
            ),
          
            NewAndHotSeriesCard(future: Api().getTopRatedSeries()),
              NewAndHotMovieCard(
              upcoming: false,
              topTen: true,
              future: Api().getTopRatedMovies(),
            ),
          
          ],
        ),
      )),
    );
  }

  Padding customTab({required text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Tab(text: text),
    );
  }
}
