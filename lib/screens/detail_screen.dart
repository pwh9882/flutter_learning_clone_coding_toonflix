import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_detail_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_episode_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/widgets/webtoon_episode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
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
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late SharedPreferences preferences;

  bool isLiked = false;

  Future initPref() async {
    preferences = await SharedPreferences.getInstance();
    final likedToons = preferences.getStringList("likedToons");
    if (likedToons != null) {
      if (likedToons.contains(widget.webtoon.id) == true) {
        setState(() {
          isLiked = true;
        });
        // print("liked!");
      }
    } else {
      await preferences.setStringList('likedToons', []);
    }
  }

  void onHeartTap() async {
    final likedToons = preferences.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.webtoon.id);
      } else {
        likedToons.add(widget.webtoon.id);
      }
      await preferences.setStringList('likedToons', likedToons);
    }
    isLiked = !isLiked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    initPref();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: isLiked
                ? const Icon(Icons.favorite_outlined)
                : const Icon(Icons.favorite_outline_outlined),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: Text(
          widget.webtoon.title,
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
                    tag: widget.webtoon.id,
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
                        widget.webtoon.thumbnail,
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
                future: widget.webtoonDetail,
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
                future: widget.webtoonEpisodes,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          WebtoonEpisode(
                            episode: episode,
                            webtoonId: widget.webtoon.id,
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
