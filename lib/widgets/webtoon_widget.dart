import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/models/webtoon_model.dart';
import 'package:flutter_learning_clone_coding_toonflix/screens/detail_screen.dart';
import 'package:flutter_learning_clone_coding_toonflix/services/api_service.dart';

// 만약 데이터 로딩이 빈번하고, 이를 위젯에서 로딩하고 싶을 때의 코드 예시:
// https://github.com/nomadcoders/toonflix/commit/b2f44bf9b0cf7fce32c52dcefddc254ab1b8a290

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoon;

  const Webtoon({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Take me home');
        Navigator.push(
          context,
          // MaterialPageRoute
          CupertinoPageRoute(
            builder: ((context) => DetailScreen(
                  webtoon: webtoon,
                  webtoonDetail: ApiService.getToonDetailById(webtoon.id),
                  webtoonEpisodes:
                      ApiService.getToonLatestEpisodesById(webtoon.id),
                )),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
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
          const SizedBox(
            width: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
