import 'dart:convert';

import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  List<WebtoonModel> webtoonInstances = [];

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // print(webtoon);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        // print(toon.title);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
