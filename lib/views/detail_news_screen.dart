import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/news_model.dart';
import 'package:getx_practice/views/favorite_screen_view_model.dart';
import 'package:getx_practice/views/news_view_model.dart';

class DetailNewsScreen extends StatelessWidget {
  DetailNewsScreen({Key? key, required this.newsIndex}) : super(key: key);
  final int newsIndex;
  final mainScreenController = Get.put(MainScreenViewModel());
  final favoriteScreenController = Get.put(FavoriteScreenViewModel());

  @override
  Widget build(BuildContext context) {
    final News news = mainScreenController.getNews(newsIndex);
    return GetX<MainScreenViewModel>(
      builder: (controller) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(CupertinoIcons.back), Text('news')]),
              onPressed: () => Navigator.pop(context)),
          middle: const Text('Detail'),
          trailing: controller.getNews(newsIndex).bookMark == false
              ? CupertinoButton(
                  child: const Icon(CupertinoIcons.heart),
                  onPressed: () {
                    favoriteScreenController
                        .addLike(controller.newsList[newsIndex]);
                    controller.changeMarking(newsIndex);
                  },
                )
              : CupertinoButton(
                  child: const Icon(CupertinoIcons.heart_fill),
                  onPressed: () {
                    favoriteScreenController
                        .deleteLike(controller.newsList[newsIndex]);
                    controller.changeMarking(newsIndex);
                  },
                ),
        ),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(children: [
              Text(
                '${news.title}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formatDate(news.publishedAt ?? DateTime.now(),
                        [yy, '.', mm, '.', dd]),
                    style: const TextStyle(color: Colors.black38),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(news.author ?? '작성자 없음')],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  fit: BoxFit.fill,
                  width: 380,
                  height: 150,
                  '${news.urlToImage}',
                ),
              ),
              const SizedBox(height: 20),
              Text('${news.description}'),
            ]),
          ),
        ),
      ),
    );
  }
}
