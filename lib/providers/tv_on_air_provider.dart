import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/tv_model.dart';

class TvOnAirProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Tv> _tvOnAir = [];
  List<Tv> get tvChannel => _tvOnAir;

  Future<void> getOnAirChannel(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/on_the_air?api_key=fbb9572d11b5458ac98f02b84f2bafc4'));
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        var respon = json.encode(jsonObject['results']);
        _tvOnAir = tvFromJson(respon);
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
