import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/detail_news_screen.dart';
import 'package:getx_practice/views/favorite_screen_view_model.dart';
import 'package:getx_practice/views/news_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Dependency Injection
  final mainScreenController = Get.put(MainScreenViewModel());
  final favoriteScreenController = Get.put(FavoriteScreenViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Cupertino는 아이폰 전용 UI를 가지고 있기 때문에 Cupertino 사용 - 피그마 UI따라가기
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('News'),
        trailing: CupertinoButton(
          // IconButton은 Material전용이므로 CupertinoButton 사용
          child: const Icon(CupertinoIcons.heart),
          onPressed: () {
            Navigator.pushNamed(context, 'FavoriteScreen');
          },
        ),
      ),
      child: GetX<MainScreenViewModel>(
        builder: (controller) => Scaffold(
          body: controller.newsList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      visualDensity: VisualDensity(vertical: 4.0),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              DetailNewsScreen(newsIndex: index),
                        ),
                      ),
                      title: Text(controller.newsList[index].title!,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                          controller.newsList[index].description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                      trailing: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              height: 200,
                              width: 100,
                              fit: BoxFit.cover,
                              controller.newsList[index].urlToImage!),
                        ),
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: controller.newsList[index].bookMark!
                              ? CupertinoButton(
                                  onPressed: () {
                                    favoriteScreenController
                                        .deleteLike(controller.newsList[index]);
                                    controller.changeMarking(index);
                                  },
                                  child: const Icon(CupertinoIcons.heart_fill),
                                )
                              : CupertinoButton(
                                  onPressed: () {
                                    favoriteScreenController
                                        .addLike(controller.newsList[index]);
                                    controller.changeMarking(index);
                                  },
                                  child: const Icon(CupertinoIcons.heart),
                                ),
                        )
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: controller.newsList.length),
        ),
      ),
    );
  }
}
