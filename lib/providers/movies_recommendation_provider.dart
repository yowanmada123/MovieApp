import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie_model.dart';

class MoviesRecommendationProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Movie> _moviesRecommendation = [];
  List<Movie> get recomendationMovies => _moviesRecommendation;

  Future<void> getMoviesRecommendation(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/300/recommendations?api_key=fbb9572d11b5458ac98f02b84f2bafc4'));
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _moviesRecommendation = movieFromJson(respon);
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
