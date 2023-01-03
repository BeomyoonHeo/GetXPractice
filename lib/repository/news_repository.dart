import 'package:dio/dio.dart';
import 'package:getx_practice/model/news_model.dart';
import 'package:retrofit/http.dart';

part 'news_repository.g.dart';

const apiKey =
    'https://newsapi.org/v2/top-headlines?country=kr&apiKey=12b9be8485454b3e913575a3560b9101';

@RestApi(baseUrl: apiKey)
abstract class NewsRepository {
  factory NewsRepository(Dio dio) = _NewsRepository;

  @GET('')
  Future<NewsList> getNews();
}
