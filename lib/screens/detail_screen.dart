import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_detail_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  final WebtoonModel webtoon;
  Future<WebtoonDetailModel> webtoonDetail;

  DetailScreen({
    super.key,
    required this.webtoon,
    required this.webtoonDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "",
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: webtoon.id,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  clipBehavior: Clip.hardEdge,
                  width: 250,
                  child: Image.network(
                    webtoon.thumbnail,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: webtoonDetail,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.about);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          )
        ],
      ),
    );
  }
}
