import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/news_model.dart';
import 'package:getx_practice/repository/news_repository.dart';
import 'package:getx_practice/util/custom_log_intercepter.dart';

class MainScreenViewModel extends GetxController {
  final dio = Dio()..interceptors.add(LogIntercepter());
  late final news = NewsRemoteRepository(dio);
  late final _newsList = <News>[].obs;

  RxList<News> get newsList => _newsList;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    await news.getNews().then((value) {
      _newsList.assignAll(value.articles);
    });
  }
}
