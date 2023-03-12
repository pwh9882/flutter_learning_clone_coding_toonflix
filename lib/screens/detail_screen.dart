import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_detail_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_episode_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  final WebtoonModel webtoon;
  Future<WebtoonDetailModel> webtoonDetail;
  Future<List<WebtoonEpisodModel>> webtoonEpisodes;

  DetailScreen({
    super.key,
    required this.webtoon,
    required this.webtoonDetail,
    required this.webtoonEpisodes,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 50,
          ),
          child: Column(
            children: [
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
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoonDetail,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: webtoonEpisodes,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    offset: const Offset(5, 5),
                                    color: Colors.black.withOpacity(0.3),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    episode.title,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    );
                  }
                  return Container();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
