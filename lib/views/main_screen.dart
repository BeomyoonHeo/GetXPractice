import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/like_screen_view_model.dart';
import 'package:getx_practice/views/main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Dependency Injection
  final mainScreenController = Get.put(MainScreenViewModel());
  final likeScreenController = Get.put(LikeScreenViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Cupertino는 아이폰 전용 UI를 가지고 있기 때문에 Cupertino 사용 - 피그마 UI따라가기

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News'),
        trailing: CupertinoButton(
          // IconButton은 Material전용이므로 CupertinoButton 사용
          child: Icon(CupertinoIcons.heart),
          onPressed: () {},
        ),
      ),
      child: GetX<MainScreenViewModel>(
        builder: (controller) => Scaffold(
          body: controller.newsList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      title: Text(controller.newsList[index].title!,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                          controller.newsList[index].description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                      trailing: Stack(children: [
                        Container(
                            height: 100,
                            child: AspectRatio(
                                aspectRatio: 1.5,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  controller.newsList[index].urlToImage ??
                                      'https://picsum.photos/id/421/200/200',
                                ))),
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: controller.newsList[index].bookMark!
                              ? CupertinoButton(
                                  onPressed: () {
                                    likeScreenController
                                        .deleteLike(controller.newsList[index]);
                                    controller.changeMarking(index);
                                    setState(() {});
                                  },
                                  child: Icon(CupertinoIcons.heart_fill),
                                )
                              : CupertinoButton(
                                  onPressed: () {
                                    likeScreenController
                                        .addLike(controller.newsList[index]);
                                    controller.changeMarking(index);
                                    setState(() {});
                                  },
                                  child: Icon(CupertinoIcons.heart),
                                ),
                        )
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: controller.newsList.length),
        ),
      ),
    );
  }
}
