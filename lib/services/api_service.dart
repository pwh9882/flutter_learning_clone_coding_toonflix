import 'dart:convert';

import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_detail_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(
      url,
    );
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

  static Future<WebtoonDetailModel> getDetail(id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    final details = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(details);
      return WebtoonDetailModel.fromJson(details);
    }
    throw Error();
  }
}
