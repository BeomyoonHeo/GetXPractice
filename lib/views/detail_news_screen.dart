import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/news_model.dart';
import 'package:getx_practice/views/news_view_model.dart';

class DetailNewsScreen extends StatelessWidget {
  DetailNewsScreen({Key? key, required this.news}) : super(key: key);
  final News news;
  final detailScreenController = Get.put(MainScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return GetX<MainScreenViewModel>(
      builder: (controller) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Detail'),
          trailing: CupertinoButton(
            // IconButton은 Material전용이므로 CupertinoButton 사용
            child: const Icon(CupertinoIcons.heart),
            onPressed: () {},
          ),
        ),
        child: Scaffold(
          body: Container(
            child: Column(children: const [Text('data')]),
          ),
        ),
      ),
    );
  }
}
