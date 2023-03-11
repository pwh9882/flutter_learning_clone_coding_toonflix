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
          // snapshot == future data
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeListView(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeListView(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          width: 40,
        );
      }),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        // print("$index");
        return Column(
          children: [
            Container(
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
        );
      },
    );
  }
}
