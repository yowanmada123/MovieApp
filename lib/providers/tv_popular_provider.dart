import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie_model.dart';

import '../../models/tv_model.dart';

class TvPopularProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Tv> _tvPopular = [];
  List<Tv> get tvChannel => _tvPopular;

  Future<void> getPopularChannel(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=fbb9572d11b5458ac98f02b84f2bafc4'));
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _tvPopular = tvFromJson(respon);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Cek Koneksi Jaringan Anda"),
      ));
    }
  }
}
