import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/detail_news_screen.dart';
import 'package:getx_practice/views/favorite_screen_view_model.dart';
import 'package:getx_practice/views/news_view_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  //Dependency Injection
  final favoriteScreenController = Get.put(FavoriteScreenViewModel());
  final mainScreenController = Get.put(MainScreenViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<FavoriteScreenViewModel>(
      builder: (controller) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(CupertinoIcons.back), Text('news')]),
              onPressed: () => Navigator.pop(context)),
          middle: const Text('Favorites'),
          trailing: TextButton(
              child: const Text('Delete All'),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Delete Everything'),
                    content: const Text(
                        'Are you sure you want to Delete everything?'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('Confirm'),
                        onPressed: () {
                          controller.deleteAllLike();
                          mainScreenController.deleteAllBookMark();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }),
        ),
        child: Scaffold(
          body: controller.newsList.isEmpty
              ? const Center(child: Text('Favorites is Empty'))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DetailNewsScreen(
                              news: controller.newsList[index],
                              newsIndex: index),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      title: Text(controller.newsList[index].title!,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                          controller.newsList[index].description ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                      trailing: Stack(children: [
                        SizedBox(
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
                                    mainScreenController.changeMarking(index);
                                    controller
                                        .deleteLike(controller.newsList[index]);
                                  },
                                  child: const Icon(CupertinoIcons.heart_fill),
                                )
                              : CupertinoButton(
                                  onPressed: () {
                                    mainScreenController.changeMarking(index);
                                    controller
                                        .addLike(controller.newsList[index]);
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
