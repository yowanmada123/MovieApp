import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie_model.dart';

class MoviesNowPlayingProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Movie> _moviesNowPlaying = [];
  List<Movie> get nowPlayingMovies => _moviesNowPlaying;

  Future<void> getMoviesNowPlaying(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=fbb9572d11b5458ac98f02b84f2bafc4'));
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _moviesNowPlaying = movieFromJson(respon);
        // print(_moviesNowPlaying[0].id);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Cek Koneksi Jaringan Anda"),
      ));
    }
  }
}
