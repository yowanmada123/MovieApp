import 'package:flutter/material.dart';
import 'package:movie/pages/movie_detail_page.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/providers/movies_now_playing_provider.dart';
import 'package:movie/providers/movies_popular_provider.dart';
import 'package:movie/providers/tv_popular_provider.dart';
import 'package:movie/providers/tv_recommendation_provider.dart';
import 'package:provider/provider.dart';

import 'providers/movies_recommendation_provider.dart';
import 'providers/tv_on_air_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: '/',
      routes: {
        '/': (context) => MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => MoviesNowPlayingProvider()..getMoviesNowPlaying(context)),
              ChangeNotifierProvider(create: (context) => MoviesPopularProvider()..getMoviesPopular(context)),
              ChangeNotifierProvider(create: (context) => MoviesRecommendationProvider()..getMoviesRecommendation(context)),
              ChangeNotifierProvider(create: (context) => TvOnAirProvider()..getOnAirChannel(context)),
              ChangeNotifierProvider(create: (context) => TvRecommendationProvider()..getRecommendationChannel(context)),
              ChangeNotifierProvider(create: (context) => TvPopularProvider()..getPopularChannel(context)),
            ], child: const MyHomePage()),
      },
    );
  }
}
