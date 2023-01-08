import 'package:get/get.dart';
import 'package:getx_practice/model/news_model.dart';

class FavoriteScreenViewModel extends GetxController {
  late final _likeNewsList = <News>[].obs;

  RxList<News> get newsList => _likeNewsList;

  void addLike(News news) {
    _likeNewsList.add(news);
  }

  void deleteLike(News news) {
    _likeNewsList.remove(news);
  }

  void deleteAllLike() {
    _likeNewsList.clear();
  }
}
