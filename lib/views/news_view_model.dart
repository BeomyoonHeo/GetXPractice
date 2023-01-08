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

  News getNews(int page) {
    return _newsList[page];
  }

  void init() async {
    await news.getNews().then((value) {
      _newsList.assignAll(value.articles);
    });
  }

  void changeMarking(int index) {
    _newsList[index].bookMark = !_newsList[index].bookMark!;
    //refresh 를 통하여 해당 viewModel 을 watch 하고 있는 위젯을 Rebuild 한다.
    _newsList.refresh();
  }

  void deleteAllBookMark() {
    _newsList.map((news) => news.bookMark = false).toList();
    _newsList.refresh();
  }
}
