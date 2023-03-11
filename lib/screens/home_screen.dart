import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: const Text(
          'Today\'s Toons',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "",
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text("Loading...");
        },
      ),
    );
  }
}
