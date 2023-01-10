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
    /** favorite의 index와 main의 index가 서로 다르기 때문에 favorite News Object에 Main News List에 있는 index를 주입하여 이후
     * favorite -> Detail화면 진입 시 index에 오차가 생기는 것을 방지 하기 위함
     */
    if (_newsList[index].index == null) {
      _newsList[index].index = index;
    }
    _newsList[index].bookMark = !_newsList[index].bookMark!;
    //refresh 를 통하여 해당 viewModel 을 watch 하고 있는 위젯을 Rebuild 한다.
    _newsList.refresh();
  }

  void deleteAllBookMark() {
    _newsList.map((news) => news.bookMark = false).toList();
    _newsList.refresh();
  }
}
