import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie_model.dart';
import '../utils/const.dart';

class MovieSearchProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Movie> _listMovieBySearch = [];
  List<Movie> get nowPlayingMovies => _listMovieBySearch;

  Future<void> getMyMovie(BuildContext context, String id) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$BASEURL/search/movie?query=$id&api_key=$APIKEY'));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        print("AAAAAAAAAAAAAAAAAAAAAAAAaaa");
        _listMovieBySearch = movieFromJson(respon);
        print("BBBBBBBBBBBBBBBBBBBBBBBBBB");
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("Cek Koneksi Jaringan Anda"),
      // ));
    }
  }
}
