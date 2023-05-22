import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/tv_model.dart';

class TvRecommendationProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Tv> _tvRecommendation = [];
  List<Tv> get tvChannel => _tvRecommendation;

  Future<void> getRecommendationChannel(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/1991/recommendations?api_key=fbb9572d11b5458ac98f02b84f2bafc4'));
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _tvRecommendation = tvFromJson(respon);
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
